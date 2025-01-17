﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Data_Access.Entities;
using Business_Logic.Modules.SessionRuleModule.Interface;
using Business_Logic.Modules.SessionRuleModule.Request;
using BIDs_API.SignalR;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using AutoMapper;
using Business_Logic.Modules.SessionRuleModule.Response;
using Business_Logic.Modules.UserModule.Response;

namespace BIDs_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class SessionRuleController : ControllerBase
    {
        private readonly ISessionRuleService _SessionRuleService;
        public readonly IMapper _mapper;
        private readonly IHubContext<SessionRuleHub> _hubContext;

        public SessionRuleController(ISessionRuleService SessionRuleService
            , IMapper mapper
            , IHubContext<SessionRuleHub> hubContext)
        {
            _SessionRuleService = SessionRuleService;
            _mapper = mapper;
            _hubContext = hubContext;
        }

        // GET api/<ValuesController>
        [HttpGet]       
        public async Task<ActionResult<IEnumerable<SessionRuleResponseAdmin>>> GetSessionRulesForAdmin()
        {
            try
            {
                var list = await _SessionRuleService.GetAll();
                if (list == null)
                {
                    return NotFound();
                }
                var response = list.Select
                           (
                             emp => _mapper.Map<SessionRule, SessionRuleResponseAdmin>(emp)
                           );
                return Ok(response);
            }
            catch
            {
                return BadRequest();
            }
        }

        // GET api/<ValuesController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SessionRuleResponseAdmin>> GetSessionRuleByID([FromRoute] Guid id)
        {
            var SessionRule = _mapper.Map<SessionRuleResponseAdmin>(await _SessionRuleService.GetSessionRuleByID(id));

            if (SessionRule == null)
            {
                return NotFound();
            }

            return SessionRule;
        }

        // GET api/<ValuesController>/abc
        [HttpGet("by_name/{name}")]
        public async Task<ActionResult<SessionRuleResponseAdmin>> GetSessionRuleByName([FromRoute] string name)
        {
            var SessionRule = _mapper.Map<SessionRuleResponseAdmin>(await _SessionRuleService.GetSessionRuleByName(name));

            if (SessionRule == null)
            {
                return NotFound();
            }

            return SessionRule;
        }

        // PUT api/<ValuesController>/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = "Admin")]
        [HttpPut]
        public async Task<IActionResult> PutSessionRule([FromBody] UpdateSessionRuleRequest updateSessionRuleRequest)
        {
            try
            {
                var SessionRule = await _SessionRuleService.UpdateSessionRule(updateSessionRuleRequest);
                await _hubContext.Clients.All.SendAsync("ReceiveSessionRuleUpdate", SessionRule);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // POST api/<ValuesController>
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<ActionResult<SessionRuleResponseAdmin>> PostSessionRule([FromBody] CreateSessionRuleRequest createSessionRuleRequest)
        {
            try
            {
                var SessionRule = await _SessionRuleService.AddNewSessionRule(createSessionRuleRequest);
                await _hubContext.Clients.All.SendAsync("ReceiveSessionRuleAdd", SessionRule);
                return Ok(_mapper.Map<SessionRuleResponseAdmin>(SessionRule));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<ValuesController>/5
        [Authorize(Roles = "Admin")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSessionRule([FromRoute] Guid id)
        {
            try
            {
                var SessionRule = await _SessionRuleService.DeleteSessionRule(id);
                await _hubContext.Clients.All.SendAsync("ReceiveSessionRuleDelete", SessionRule);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
