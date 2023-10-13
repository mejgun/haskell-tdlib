module TD.Query.GetPollVoters(GetPollVoters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetPollVoters -- ^ Returns message senders voted for the specified option in a non-anonymous polls. For optimal performance, the number of returned users is chosen by TDLib
  = GetPollVoters
    { chat_id    :: Maybe Int -- ^ Identifier of the chat to which the poll belongs
    , message_id :: Maybe Int -- ^ Identifier of the message containing the poll
    , option_id  :: Maybe Int -- ^ 0-based identifier of the answer option
    , offset     :: Maybe Int -- ^ Number of voters to skip in the result; must be non-negative
    , limit      :: Maybe Int -- ^ The maximum number of voters to be returned; must be positive and can't be greater than 50. For optimal performance, the number of returned voters is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached
    }
  deriving (Eq)

instance Show GetPollVoters where
  show
    GetPollVoters
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_id  = option_id_
      , offset     = offset_
      , limit      = limit_
      }
        = "GetPollVoters"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "option_id"  `I.p` option_id_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON GetPollVoters where
  toJSON
    GetPollVoters
      { chat_id    = chat_id_
      , message_id = message_id_
      , option_id  = option_id_
      , offset     = offset_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "getPollVoters"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "option_id"  A..= option_id_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          ]
