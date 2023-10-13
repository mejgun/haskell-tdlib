module TD.Query.GetBlockedMessageSenders(GetBlockedMessageSenders(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetBlockedMessageSenders -- ^ Returns users and chats that were blocked by the current user
  = GetBlockedMessageSenders
    { offset :: Maybe Int -- ^ Number of users and chats to skip in the result; must be non-negative
    , limit  :: Maybe Int -- ^ The maximum number of users and chats to return; up to 100
    }
  deriving (Eq)

instance Show GetBlockedMessageSenders where
  show
    GetBlockedMessageSenders
      { offset = offset_
      , limit  = limit_
      }
        = "GetBlockedMessageSenders"
          ++ I.cc
          [ "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetBlockedMessageSenders where
  toJSON
    GetBlockedMessageSenders
      { offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getBlockedMessageSenders"
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]
