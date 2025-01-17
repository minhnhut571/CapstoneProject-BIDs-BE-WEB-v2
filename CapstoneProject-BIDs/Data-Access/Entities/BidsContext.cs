﻿using System;
using System.Security.Cryptography;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Logging;

#nullable disable

namespace Data_Access.Entities
{
    public partial class BIDsContext : DbContext
    {
        public BIDsContext()
        {
        }

        public BIDsContext(DbContextOptions<BIDsContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<AdminNotificationDetail> AdminNotificationDetails { get; set; }
        public virtual DbSet<BanHistory> BanHistories { get; set; }
        public virtual DbSet<BookingItem> BookingItems { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Description> Descriptions { get; set; }
        public virtual DbSet<Fee> Fees { get; set; }
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<ItemDescription> ItemDescriptions { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<NotificationType> NotificationTypes { get; set; }
        public virtual DbSet<PaymentMethodStaff> PaymentMethodStaffs { get; set; }
        public virtual DbSet<PaymentMethodUser> PaymentMethodUsers { get; set; }
        public virtual DbSet<PaymentStaff> PaymentStaffs { get; set; }
        public virtual DbSet<PaymentUser> PaymentUsers { get; set; }
        public virtual DbSet<Session> Sessions { get; set; }
        public virtual DbSet<SessionDetail> SessionDetails { get; set; }
        public virtual DbSet<SessionRule> SessionRules { get; set; }
        public virtual DbSet<StaffNotificationDetail> StaffNotificationDetails { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UserNotificationDetail> UserNotificationDetails { get; set; }
        public virtual DbSet<Staff> Staff { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                // Set up logging to log the inner exceptions for debugging purposes
                ILoggerFactory loggerFactory = LoggerFactory.Create(builder =>
                {
                    builder
                        .AddConsole()
                        .AddFilter(level => level >= LogLevel.Warning); // Adjust log level as needed
                });

                optionsBuilder
                              .UseSqlServer("server=MINHNHUT\\NHUT57; database=BIDs; uid=sa; pwd=05072001;")
                              //.UseSqlServer("Server = tcp:bidonlinetesting.database.windows.net,1433; Initial Catalog = bidtest; Persist Security Info = False; User ID = bid - admin; Password = 123Helloall!@#;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;\r\n")
                              .UseLoggerFactory(loggerFactory); // Use the created loggerFactory
            }

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Admin>(entity =>
            {
                entity.ToTable("Admin");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Address");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Email");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasColumnName("Phone");
            });

            modelBuilder.Entity<AdminNotificationDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("AdminNotificationDetail");

                entity.Property(e => e.AdminId).HasColumnName("AdminID");

                entity.Property(e => e.Messages).IsRequired().HasColumnName("Messages");

                entity.Property(e => e.NotificationId).HasColumnName("NotificationID");

                entity.Property(e => e.TypeId).HasColumnName("TypeID");

                entity.HasOne(d => d.Admin)
                    .WithMany()
                    .HasForeignKey(d => d.AdminId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AdminNoti__Admin__5DCAEF64");

                entity.HasOne(d => d.Notification)
                    .WithMany()
                    .HasForeignKey(d => d.NotificationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AdminNoti__Notif__5BE2A6F2");

                entity.HasOne(d => d.Type)
                    .WithMany()
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AdminNoti__TypeI__5CD6CB2B");
            });

            modelBuilder.Entity<BanHistory>(entity =>
            {
                entity.ToTable("BanHistory");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Reason");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.BanHistories)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BanHistor__UserI__300424B4");
            });

            modelBuilder.Entity<BookingItem>(entity =>
            {
                entity.ToTable("BookingItem");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");

                entity.Property(e => e.ItemId).HasColumnName("ItemID");

                entity.Property(e => e.StaffId).HasColumnName("StaffID");

                entity.Property(e => e.Status).HasColumnName("Status");

                entity.HasOne(d => d.Item)
                    .WithMany(p => p.BookingItems)
                    .HasForeignKey(d => d.ItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BookingIt__ItemI__3B75D760");

                entity.HasOne(d => d.Staff)
                    .WithMany(p => p.BookingItems)
                    .HasForeignKey(d => d.StaffId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BookingIt__Staff__3D5E1FD2");

            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("Category");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<Description>(entity =>
            {
                entity.ToTable("Description");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Descriptions)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Descripti__Categ__34C8D9D1");
            });

            modelBuilder.Entity<Fee>(entity =>
            {
                entity.ToTable("Fee");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.Min).IsRequired().HasColumnName("Min");

                entity.Property(e => e.Max).IsRequired().HasColumnName("Max");

                entity.Property(e => e.DepositFee).IsRequired().HasColumnName("DepositFee");

                entity.Property(e => e.ParticipationFee).IsRequired().HasColumnName("ParticipationFee");

                entity.Property(e => e.Surcharge).IsRequired().HasColumnName("Surcharge");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<Item>(entity =>
            {
                entity.ToTable("Item");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.DescriptionDetail).IsRequired()
                    .HasMaxLength(int.MaxValue).HasColumnName("DescriptionDetail");

                entity.Property(e => e.StepPrice).IsRequired().HasColumnName("StepPrice");

                entity.Property(e => e.Quantity).IsRequired().HasColumnName("Quantity");

                entity.Property(e => e.FirstPrice).IsRequired().HasColumnName("FirstPrice");

                entity.Property(e => e.Deposit).IsRequired().HasColumnName("Deposit");

                entity.Property(e => e.Image).IsRequired()
                    .HasMaxLength(int.MaxValue).HasColumnName("Image");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Items)
                    .HasForeignKey(d => d.CategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Item__CategoryID__38996AB5");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Items)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Item__UserID__37A5467C");
            });

            modelBuilder.Entity<ItemDescription>(entity =>
            {
                entity.ToTable("ItemDescription");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.ItemId).IsRequired().HasColumnName("ItemID");

                entity.Property(e => e.DescriptionId).IsRequired().HasColumnName("DescriptionID");

                entity.Property(e => e.Detail)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Detail");

                entity.HasOne(d => d.Description)
                    .WithMany(p => p.ItemDescriptions)
                    .HasForeignKey(d => d.DescriptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ItemDescription_Description");

                entity.HasOne(d => d.Item)
                    .WithMany(p => p.ItemDescriptions)
                    .HasForeignKey(d => d.ItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ItemDescription_Item");
            });

            modelBuilder.Entity<Notification>(entity =>
            {
                entity.ToTable("Notification");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.ExpireDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<NotificationType>(entity =>
            {
                entity.ToTable("NotificationType");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<PaymentMethodStaff>(entity =>
            {
                entity.ToTable("PaymentMethodStaff");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.BankName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Number)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.OwnerName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.StaffId).HasColumnName("StaffID");

                entity.HasOne(d => d.Staff)
                    .WithMany(p => p.PaymentMethodStaffs)
                    .HasForeignKey(d => d.StaffId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentMe__Staff__2D27B809");
            });

            modelBuilder.Entity<PaymentMethodUser>(entity =>
            {
                entity.ToTable("PaymentMethodUser");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.BankName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Number)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.OwnerName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.PaymentMethodUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentMe__UserI__2A4B4B5E");
            });

            modelBuilder.Entity<PaymentStaff>(entity =>
            {
                entity.ToTable("PaymentStaff");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.Detail)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.MethodId).HasColumnName("MethodID");

                entity.Property(e => e.SessionId).HasColumnName("SessionID");

                entity.Property(e => e.StaffId).HasColumnName("StaffID");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("type");

                entity.HasOne(d => d.Method)
                    .WithMany(p => p.PaymentStaffs)
                    .HasForeignKey(d => d.MethodId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentSt__Metho__4CA06362");

                entity.HasOne(d => d.Session)
                    .WithMany(p => p.PaymentStaffs)
                    .HasForeignKey(d => d.SessionId)
                    .HasConstraintName("FK__PaymentSt__Sessi__4E88ABD4");

                entity.HasOne(d => d.Staff)
                    .WithMany(p => p.PaymentStaffs)
                    .HasForeignKey(d => d.StaffId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentSt__Staff__4D94879B");
            });

            modelBuilder.Entity<PaymentUser>(entity =>
            {
                entity.ToTable("PaymentUser");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.Detail)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.MethodId).HasColumnName("MethodID");

                entity.Property(e => e.SessionId).HasColumnName("SessionID");

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("type");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Method)
                    .WithMany(p => p.PaymentUsers)
                    .HasForeignKey(d => d.MethodId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentUs__Metho__47DBAE45");

                entity.HasOne(d => d.Session)
                    .WithMany(p => p.PaymentUsers)
                    .HasForeignKey(d => d.SessionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentUs__Sessi__49C3F6B7");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.PaymentUsers)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentUs__UserI__48CFD27E");
            });

            modelBuilder.Entity<Session>(entity =>
            {
                entity.ToTable("Session");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.AuctionTime).HasColumnName("AuctionTime").HasColumnType("time(7)");

                entity.Property(e => e.BeginTime).HasColumnType("datetime");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.EndTime).HasColumnType("datetime");

                entity.Property(e => e.FeeId).HasColumnName("FeeID");

                entity.Property(e => e.SessionRuleId).HasColumnName("SessionRuleID");

                entity.Property(e => e.FinalPrice).HasColumnName("FinalPrice");

                entity.Property(e => e.ItemId).HasColumnName("ItemID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.Status)
                    .HasColumnName("Status");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");

                entity.HasOne(d => d.Fee)
                    .WithMany(p => p.Sessions)
                    .HasForeignKey(d => d.FeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Session__FeeID__4222D4EF");
                entity.HasOne(d => d.SessionRule)
                    .WithMany(p => p.Sessions)
                    .HasForeignKey(d => d.SessionRuleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Session_SessionRule");
                entity.HasOne(d => d.Item)
                    .WithMany(p => p.Sessions)
                    .HasForeignKey(d => d.ItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Session__Item");
            });

            modelBuilder.Entity<SessionDetail>(entity =>
            {
                entity.ToTable("SessionDetail");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.SessionId).HasColumnName("SessionID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.Property(e => e.Price).HasColumnName("Price");

                entity.HasOne(d => d.Session)
                    .WithMany(p => p.SessionDetails)
                    .HasForeignKey(d => d.SessionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SessionDe__Sessi__44FF419A");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.SessionDetails)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__SessionDe__UserI__440B1D61");
            });

            modelBuilder.Entity<SessionRule>(entity =>
            {
                entity.ToTable("SessionRule");

                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("ID");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.IncreaseTime).IsRequired().HasColumnName("IncreaseTime");

                entity.Property(e => e.FreeTime).IsRequired().HasColumnName("FreeTime").HasColumnType("time(7)"); ;

                entity.Property(e => e.DelayTime).IsRequired().HasColumnName("DelayTime").HasColumnType("time(7)"); ;

                entity.Property(e => e.DelayFreeTime).IsRequired().HasColumnName("DelayFreeTime").HasColumnType("time(7)"); ;

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<StaffNotificationDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("StaffNotificationDetail");

                entity.Property(e => e.Messages).IsRequired();

                entity.Property(e => e.NotificationId).HasColumnName("NotificationID");

                entity.Property(e => e.StaffId).HasColumnName("StaffID");

                entity.Property(e => e.TypeId).HasColumnName("TypeID");

                entity.HasOne(d => d.Notification)
                    .WithMany()
                    .HasForeignKey(d => d.NotificationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StaffNoti__Notif__5812160E");

                entity.HasOne(d => d.Staff)
                    .WithMany()
                    .HasForeignKey(d => d.StaffId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StaffNoti__Staff__59FA5E80");

                entity.HasOne(d => d.Type)
                    .WithMany()
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StaffNoti__TypeI__59063A47");
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.ToTable("Users");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Address");

                entity.Property(e => e.Avatar)
                    .IsRequired()
                    .HasMaxLength(int.MaxValue)
                    .HasColumnName("Avatar");

                entity.Property(e => e.Role)
                    .IsRequired()
                    .HasColumnName("Role");

                entity.Property(e => e.CccdbackImage)
                    .IsRequired()
                    .HasColumnName("CCCDBackImage");

                entity.Property(e => e.CccdfrontImage)
                    .IsRequired()
                    .HasColumnName("CCCDFrontImage");

                entity.Property(e => e.Cccdnumber)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasColumnName("CCCDNumber");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.DateOfBirth).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Email");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasColumnName("Phone");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");
                entity.Property(e => e.Status).HasColumnName("Status");
            });

            modelBuilder.Entity<UserNotificationDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("UserNotificationDetail");

                entity.Property(e => e.Messages).IsRequired();

                entity.Property(e => e.NotificationId).HasColumnName("NotificationID");

                entity.Property(e => e.TypeId).HasColumnName("TypeID");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.HasOne(d => d.Notification)
                    .WithMany()
                    .HasForeignKey(d => d.NotificationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__UserNotif__Notif__5441852A");

                entity.HasOne(d => d.Type)
                    .WithMany()
                    .HasForeignKey(d => d.TypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__UserNotif__TypeI__5535A963");

                entity.HasOne(d => d.User)
                    .WithMany()
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__UserNotif__UserI__5629CD9C");
            });

            modelBuilder.Entity<Staff>(entity =>
            {
                entity.ToTable("Staff");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("ID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Address");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.DateOfBirth).HasColumnType("datetime");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Email");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("Password");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasColumnName("Phone");

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
