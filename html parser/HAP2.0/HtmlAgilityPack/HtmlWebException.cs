// HtmlAgilityPack V1.0 - Simon Mourier <simon_mourier@hotmail.com>
using System;

namespace HtmlAgilityPack
{
    /// <summary>
    /// Represents an exception thrown by the HtmlWeb utility class.
    /// </summary>
    public class HtmlWebException : Exception
    {
        /// <summary>
        /// Creates an instance of the HtmlWebException.
        /// </summary>
        /// <param name="message">The exception's message.</param>
        public HtmlWebException(string message)
            : base(message)
        {
        }
    }
}