﻿using Business_Logic.Modules.ItemModule.Interface;
using Business_Logic.Modules.ItemModule.Request;
using Business_Logic.Modules.CategoryModule.Interface;
using Data_Access.Constant;
using Data_Access.Entities;
using FluentValidation.Results;
using Business_Logic.Modules.BookingItemModule.Request;
using Business_Logic.Modules.BookingItemModule.Interface;
using Data_Access.Enum;
using Microsoft.EntityFrameworkCore;

namespace Business_Logic.Modules.ItemModule
{
    public class ItemService : IItemService
    {
        private readonly IItemRepository _ItemRepository;
        private readonly ICategoryService _CategoryService;
        private readonly IBookingItemService _BookingItemService;

        public ItemService(IItemRepository ItemRepository
            , ICategoryService CategoryService
            , IBookingItemService BookingItemService)
        {
            _ItemRepository = ItemRepository;
            _CategoryService = CategoryService;
            _BookingItemService = BookingItemService;
        }

        public async Task<ICollection<Item>> GetAll()
        {
            var items = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.OrderByDescending(x => x.UpdateDate).ToList()); 
            return items;
        }

        public Task<ICollection<Item>> GetItemsIsValid()
        {
            return _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description");
        }

        public async Task<ICollection<Item>> GetItemByID(Guid? id)
        {
            if (id == null)
            {
                throw new Exception(ErrorMessage.CommonError.ID_IS_NULL);
            }
            var Item = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.Id == id).ToList());
            if (Item == null)
            {
                throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
            }
            return Item;
        }

        public async Task<ICollection<Item>> GetItemByName(string ItemName)
        {
            if (ItemName == null)
            {
                throw new Exception(ErrorMessage.CommonError.NAME_IS_NULL);
            }
            var Item = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.Name == ItemName).ToList());
            if (Item == null)
            {
                throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
            }
            return Item;
        }

        public async Task<ICollection<Item>> GetItemByUserID(Guid? id)
        {
            if (id == null)
            {
                throw new Exception(ErrorMessage.CommonError.ID_IS_NULL);
            }
            var Item = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.UserId == id).ToList());
            if (Item == null)
            {
                throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
            }
            return Item;
        }

        public async Task<ICollection<Item>> GetItemByCategoryName(string CategoryName)
        {
            if (CategoryName == null)
            {
                throw new Exception(ErrorMessage.CommonError.NAME_IS_NULL);
            }
            var CategoryCheck = await _CategoryService.GetCategoryByName(CategoryName);
            var Item = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.CategoryId == CategoryCheck.First().Id).ToList());
            if (Item == null)
            {
                throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
            }
            return Item;
        }

        public async Task<ICollection<Item>> GetItemByCategoryNameAndUser(string CategoryName, Guid id)
        {
            if (CategoryName == null)
            {
                throw new Exception(ErrorMessage.CommonError.NAME_IS_NULL);
            }
            var CategoryCheck = await _CategoryService.GetCategoryByName(CategoryName);
            var Item = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.CategoryId == CategoryCheck.First().Id && x.UserId == id).ToList());
            if (Item == null)
            {
                throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
            }
            return Item;
        }

        public async Task<ICollection<Item>> GetItemByNameAndUser(string name, Guid id)
        {
            if (name == null)
            {
                throw new Exception(ErrorMessage.CommonError.NAME_IS_NULL);
            }
            var Item = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.Name == name && x.UserId == id).ToList());
            if (Item == null)
            {
                throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
            }
            return Item;
        }

        public async Task<ICollection<Item>> AddNewItem(CreateItemRequest ItemRequest)
        {

            ValidationResult result = new CreateItemRequestValidator().Validate(ItemRequest);
            if (!result.IsValid)
            {
                throw new Exception(ErrorMessage.CommonError.INVALID_REQUEST);
            }

            if(ItemRequest.StepPrice < (ItemRequest.FirstPrice*0.05)
                || ItemRequest.StepPrice > (ItemRequest.FirstPrice*0.1))
            {
                throw new Exception(ErrorMessage.ItemError.INVALID_STEP_PRICE);
            }

            var newItem = new Item();

            newItem.Id = Guid.NewGuid();
            newItem.Name = ItemRequest.ItemName;
            newItem.DescriptionDetail = ItemRequest.Description;
            newItem.UserId = ItemRequest.UserId;
            newItem.Quantity = ItemRequest.Quantity;
            newItem.FirstPrice = ItemRequest.FirstPrice;
            newItem.StepPrice = ItemRequest.StepPrice;
            newItem.Image = ItemRequest.Image;
            newItem.CategoryId = ItemRequest.CategoryId;
            newItem.Deposit = ItemRequest.Deposit;
            newItem.UpdateDate = DateTime.Now;
            newItem.CreateDate = DateTime.Now;

            await _ItemRepository.AddAsync(newItem);
            CreateBookingItemRequest bookingItemRequest = new CreateBookingItemRequest()
            {
                ItemId = newItem.Id,
            };
            await _BookingItemService.AddNewBookingItem(bookingItemRequest);
            var items = await _ItemRepository.GetAll(includeProperties: "User,Category,ItemDescriptions,BookingItems,ItemDescriptions.Description"
                , options: o => o.Where(x => x.Id == newItem.Id).ToList());
            return items;
        }

        public async Task<Item> UpdateItem(UpdateItemRequest ItemRequest)
        {
            try
            {
                var ItemUpdate = await _ItemRepository.GetFirstOrDefaultAsync(x => x.Id == ItemRequest.ItemId);

                if (ItemUpdate == null)
                {
                    throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
                }

                ValidationResult result = new UpdateItemRequestValidator().Validate(ItemRequest);
                if (!result.IsValid)
                {
                    throw new Exception(ErrorMessage.CommonError.INVALID_REQUEST);
                }

                Item ItemCheck = _ItemRepository.GetFirstOrDefaultAsync(x => x.Name == ItemRequest.ItemName).Result;

                if (ItemCheck != null)
                {
                    if(ItemUpdate.Id != ItemCheck.Id)
                    {
                        throw new Exception(ErrorMessage.ItemError.ITEM_EXISTED);
                    }
                }

                if (ItemRequest.StepPrice > (ItemRequest.FirstPrice * 0.05)
                && ItemRequest.StepPrice < (ItemRequest.FirstPrice * 0.1))
                {
                    throw new Exception(ErrorMessage.ItemError.INVALID_STEP_PRICE);
                }

                ItemUpdate.Id = ItemRequest.ItemId;
                ItemUpdate.Name = ItemRequest.ItemName;
                ItemUpdate.DescriptionDetail = ItemRequest.Description;
                ItemUpdate.Quantity = ItemRequest.Quantity;
                ItemUpdate.FirstPrice = ItemRequest.FirstPrice;
                ItemUpdate.StepPrice = ItemRequest.StepPrice;
                ItemUpdate.Image = ItemRequest.Image;
                ItemUpdate.Deposit = ItemRequest.Deposit;
                ItemUpdate.UpdateDate = DateTime.Now;

                await _ItemRepository.UpdateAsync(ItemUpdate);
                return ItemUpdate;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error at update type: " + ex.Message);
                throw new Exception(ex.Message);
            }

        }

        //public async Task<Item> DeleteItem(Guid ItemDeleteID)
        //{
        //    try
        //    {
        //        if (ItemDeleteID == null)
        //        {
        //            throw new Exception(ErrorMessage.CommonError.ID_IS_NULL);
        //        }

        //        Item ItemDelete = _ItemRepository.GetFirstOrDefaultAsync(x => x.Id == ItemDeleteID).Result;

        //        if (ItemDelete == null)
        //        {
        //            throw new Exception(ErrorMessage.ItemError.ITEM_NOT_FOUND);
        //        }

        //        await _ItemRepository.UpdateAsync(ItemDelete);
        //        ICollection<BookingItem> bookingItem = await _BookingItemService.GetBookingItemByItem(ItemDeleteID);
        //        UpdateBookingItemRequest bookingItemRequest = new UpdateBookingItemRequest()
        //        {
        //            Id = bookingItem.First().Id,
        //            Status = (int)BookingItemEnum.Unactive
        //        };
        //        await _BookingItemService.UpdateStatusBookingItem(bookingItemRequest);
        //        return ItemDelete;
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine("Error at delete type: " + ex.Message);
        //        throw new Exception(ex.Message);
        //    }
        //}

    }
}
