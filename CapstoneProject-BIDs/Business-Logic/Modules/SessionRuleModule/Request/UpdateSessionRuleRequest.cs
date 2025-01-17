﻿using FluentValidation;
using System;

namespace Business_Logic.Modules.SessionRuleModule.Request
{
    public class UpdateSessionRuleRequest
    {
        public Guid SessionRuleId { get; set; }
        public string Name { get; set; }
        public int IncreaseTime { get; set; }
        public SetTime FreeTime { get; set; }
        public SetTime DelayTime { get; set; }
        public SetTime DelayFreeTime { get; set; }
        public bool Status { get; set; }
    }
    public class UpdateSessionRuleRequestValidator : AbstractValidator<UpdateSessionRuleRequest>
    {
        public UpdateSessionRuleRequestValidator()
        {
            RuleFor(x => x.SessionRuleId).NotEmpty().NotNull();
            RuleFor(x => x.Name).NotEmpty().NotNull();
            RuleFor(x => x.IncreaseTime).NotEmpty().NotNull();
            RuleFor(x => x.FreeTime).NotEmpty().NotNull();
            RuleFor(x => x.DelayTime).NotEmpty().NotNull();
            RuleFor(x => x.DelayFreeTime).NotEmpty().NotNull();
            RuleFor(x => x.Status).NotEmpty().NotNull();
        }
    }
}
