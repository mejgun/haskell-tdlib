module TD.Query.ApproveSuggestedPost
  (ApproveSuggestedPost(..)
  , defaultApproveSuggestedPost
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Approves a suggested post in a channel direct messages chat. Returns 'TD.Data.Ok.Ok'
data ApproveSuggestedPost
  = ApproveSuggestedPost
    { chat_id    :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , message_id :: Maybe Int -- ^ Identifier of the message with the suggested post. Use messageProperties.can_be_approved to check whether the suggested post can be approved
    , send_date  :: Maybe Int -- ^ Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date has already been chosen
    }
  deriving (Eq, Show)

instance I.ShortShow ApproveSuggestedPost where
  shortShow
    ApproveSuggestedPost
      { chat_id    = chat_id_
      , message_id = message_id_
      , send_date  = send_date_
      }
        = "ApproveSuggestedPost"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "send_date"  `I.p` send_date_
          ]

instance AT.ToJSON ApproveSuggestedPost where
  toJSON
    ApproveSuggestedPost
      { chat_id    = chat_id_
      , message_id = message_id_
      , send_date  = send_date_
      }
        = A.object
          [ "@type"      A..= AT.String "approveSuggestedPost"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "send_date"  A..= send_date_
          ]

defaultApproveSuggestedPost :: ApproveSuggestedPost
defaultApproveSuggestedPost =
  ApproveSuggestedPost
    { chat_id    = Nothing
    , message_id = Nothing
    , send_date  = Nothing
    }

