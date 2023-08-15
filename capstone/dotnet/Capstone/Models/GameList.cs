﻿using System.Collections.Generic;

namespace Capstone.Models
{
    public class GameList
    {
        public int ListId { get; set; }

        public int UserId { get; set; }

        public string ListTitle { get; set; }

        public string ListType { get; set; }

        public bool IsDefault { get; set; }

        public List<Game> Games { get; set; }
    }
}