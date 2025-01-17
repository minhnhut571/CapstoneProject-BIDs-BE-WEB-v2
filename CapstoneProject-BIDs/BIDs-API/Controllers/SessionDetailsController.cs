﻿using AutoMapper;
using BIDs_API.SignalR;
using Business_Logic.Modules.SessionDetailModule.Interface;
using Business_Logic.Modules.SessionDetailModule.Request;
using Business_Logic.Modules.SessionDetailModule.Response;
using Business_Logic.Modules.SessionModule.Interface;
using Data_Access.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace BIDs_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class SessionDetailsController : ControllerBase
    {
        private readonly ISessionDetailService _SessionDetailService;
        private readonly IHubContext<SessionDetailHub> _hubSessionDetailContext;
        private readonly IHubContext<SessionHub> _hubSessionContext;
        private readonly IMapper _mapper;
        private readonly ISessionService _SessionService;

        public SessionDetailsController(ISessionDetailService SessionDetailService
            , IHubContext<SessionDetailHub> hubSessionDetailContext
            , IHubContext<SessionHub> hubSessionContext
            , IMapper mapper
            , ISessionService SessionService)
        {
            _SessionDetailService = SessionDetailService;
            _hubSessionDetailContext = hubSessionDetailContext;
            _mapper = mapper;
            _SessionService = SessionService;
            _hubSessionContext = hubSessionContext;
        }

        // GET api/<ValuesController>
        [Authorize(Roles = "Staff,Admin")]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SessionDetailResponseStaffAndAdmin>>> GetSessionDetailsForAdminAndStaff()
        {
            try
            {
                var list = await _SessionDetailService.GetAll();
                if (list == null)
                {
                    return NotFound();
                }
                var response = list.Select
                           (
                             emp => _mapper.Map<SessionDetail, SessionDetailResponseStaffAndAdmin>(emp)
                           );
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        // GET api/<ValuesController>/5
        [Authorize(Roles = "Staff,Admin")]
        [HttpGet("{id}")]
        public async Task<ActionResult<SessionDetailResponseStaffAndAdmin>> GetSessionDetailByID([FromRoute] Guid? id)
        {
            try
            {
                var list = await _SessionDetailService.GetSessionDetailByID(id);
                if (list == null)
                {
                    return NotFound();
                }
                var response = list.Select
                           (
                             emp => _mapper.Map<SessionDetail, SessionDetailResponseStaffAndAdmin>(emp)
                           );
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        // GET api/<ValuesController>/abc
        [HttpGet("by_user/{id}")]
        public async Task<ActionResult<IEnumerable<SessionDetailResponseUser>>> GetSessionDetailByUser([FromRoute] Guid? id)
        {
            try
            {
                var list = await _SessionDetailService.GetSessionDetailByUser(id);
                if (list == null)
                {
                    return NotFound();
                }
                var response = list.Select
                           (
                             emp => _mapper.Map<SessionDetail, SessionDetailResponseUser>(emp)
                           );
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        // GET api/<ValuesController>/abc
        [HttpGet("by_session/{id}")]
        public async Task<ActionResult<IEnumerable<SessionDetailResponseUser>>> GetSessionDetailBySession([FromRoute] Guid? id)
        {
            try
            {
                var list = await _SessionDetailService.GetSessionDetailBySession(id);
                if (list == null)
                {
                    return NotFound();
                }
                var response = list.Select
                           (
                             emp => _mapper.Map<SessionDetail, SessionDetailResponseUser>(emp)
                           );
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        // GET api/<ValuesController>/abc
        [HttpGet("by_session_for_auctioneer")]
        public async Task<ActionResult<IEnumerable<SessionDetailResponseUser>>> GetSessionDetailBySessionForAuctioneer([FromHeader] Guid? id, Guid? userId)
        {
            try
            {
                var list = await _SessionDetailService.GetSessionDetailBySessionForAuctioneer(id, userId);
                if (list == null)
                {
                    return NotFound();
                }
                var response = list.Select
                           (
                             emp => _mapper.Map<SessionDetail, SessionDetailResponseUser>(emp)
                           );
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        // PUT api/<ValuesController>/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = "Staff,Admin")]
        [HttpPut]
        public async Task<IActionResult> PutSessionDetail([FromBody] UpdateSessionDetailRequest updateSessionDetailRequest)
        {
            try
            {
                var SessionDetail = await _SessionDetailService.UpdateSessionDetail(updateSessionDetailRequest);
                await _hubSessionDetailContext.Clients.All.SendAsync("ReceiveSessionDetailUpdate", SessionDetail);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<ValuesController>
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = "Bidder,Auctioneer")]
        [HttpPost("increase_price")]
        public async Task<ActionResult<SessionDetailResponseStaffAndAdmin>> IncreasePrice([FromBody] CreateSessionDetailRequest createSessionDetailRequest)
        {
            try
            {
                var SessionDetail = await _SessionDetailService.IncreasePrice(createSessionDetailRequest);
                var Session = await _SessionService.GetSessionByID(SessionDetail.SessionId);
                await _hubSessionDetailContext.Clients.All.SendAsync("ReceiveSessionDetailAdd", SessionDetail);
                await _hubSessionDetailContext.Clients.All.SendAsync("ReceiveSessionUpdate", Session.ElementAt(0));
                return Ok(_mapper.Map<SessionDetailResponseStaffAndAdmin>(SessionDetail));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<ValuesController>
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = "Bidder,Auctioneer")]
        [HttpPost("joinning")]
        public async Task<ActionResult<SessionDetailResponseStaffAndAdmin>> Joinning([FromBody] CreateSessionDetailRequest createSessionDetailRequest)
        {
            try
            {
                var SessionDetail = await _SessionDetailService.Joinning(createSessionDetailRequest);
                var Session = await _SessionService.GetSessionByID(SessionDetail.SessionId);
                await _hubSessionDetailContext.Clients.All.SendAsync("ReceiveSessionDetailAdd", SessionDetail);
                await _hubSessionDetailContext.Clients.All.SendAsync("ReceiveSessionUpdate", Session.ElementAt(0));
                return Ok(_mapper.Map<SessionDetailResponseStaffAndAdmin>(SessionDetail));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<ValuesController>/5
        [Authorize(Roles = "Staff,Admin")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSessionDetail([FromRoute] Guid? id)
        {
            try
            {
                var SessionDetail = await _SessionDetailService.DeleteSessionDetail(id);
                await _hubSessionDetailContext.Clients.All.SendAsync("ReceiveSessionDetailDelete", SessionDetail);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
