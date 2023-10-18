module TD.Query.GetBlockedMessageSenders
  (GetBlockedMessageSenders(..)
  , defaultGetBlockedMessageSenders
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BlockList as BlockList

-- | Returns users and chats that were blocked by the current user. Returns 'TD.Data.MessageSenders.MessageSenders'
data GetBlockedMessageSenders
  = GetBlockedMessageSenders
    { block_list :: Maybe BlockList.BlockList -- ^ Block list from which to return users
    , offset     :: Maybe Int                 -- ^ Number of users and chats to skip in the result; must be non-negative
    , limit      :: Maybe Int                 -- ^ The maximum number of users and chats to return; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow GetBlockedMessageSenders where
  shortShow
    GetBlockedMessageSenders
      { block_list = block_list_
      , offset     = offset_
      , limit      = limit_
      }
        = "GetBlockedMessageSenders"
          ++ I.cc
          [ "block_list" `I.p` block_list_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON GetBlockedMessageSenders where
  toJSON
    GetBlockedMessageSenders
      { block_list = block_list_
      , offset     = offset_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "getBlockedMessageSenders"
          , "block_list" A..= block_list_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          ]

defaultGetBlockedMessageSenders :: GetBlockedMessageSenders
defaultGetBlockedMessageSenders =
  GetBlockedMessageSenders
    { block_list = Nothing
    , offset     = Nothing
    , limit      = Nothing
    }

