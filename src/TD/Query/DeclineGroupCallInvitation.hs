module TD.Query.DeclineGroupCallInvitation
  (DeclineGroupCallInvitation(..)
  , defaultDeclineGroupCallInvitation
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Declines an invitation to an active group call via messageGroupCall. Can be called both by the sender and the receiver of the invitation. Returns 'TD.Data.Ok.Ok'
data DeclineGroupCallInvitation
  = DeclineGroupCallInvitation
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int -- ^ Identifier of the message of the type messageGroupCall
    }
  deriving (Eq, Show)

instance I.ShortShow DeclineGroupCallInvitation where
  shortShow
    DeclineGroupCallInvitation
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "DeclineGroupCallInvitation"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON DeclineGroupCallInvitation where
  toJSON
    DeclineGroupCallInvitation
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "declineGroupCallInvitation"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultDeclineGroupCallInvitation :: DeclineGroupCallInvitation
defaultDeclineGroupCallInvitation =
  DeclineGroupCallInvitation
    { chat_id    = Nothing
    , message_id = Nothing
    }

