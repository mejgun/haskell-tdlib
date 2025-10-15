module TD.Query.SendGroupCallMessage
  (SendGroupCallMessage(..)
  , defaultSendGroupCallMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Sends a message to other participants of a group call. Requires groupCall.can_send_messages right. Returns 'TD.Data.Ok.Ok'
data SendGroupCallMessage
  = SendGroupCallMessage
    { group_call_id :: Maybe Int                         -- ^ Group call identifier
    , text          :: Maybe FormattedText.FormattedText -- ^ Text of the message to send; 1-getOption("group_call_message_text_length_max") characters
    }
  deriving (Eq, Show)

instance I.ShortShow SendGroupCallMessage where
  shortShow
    SendGroupCallMessage
      { group_call_id = group_call_id_
      , text          = text_
      }
        = "SendGroupCallMessage"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "text"          `I.p` text_
          ]

instance AT.ToJSON SendGroupCallMessage where
  toJSON
    SendGroupCallMessage
      { group_call_id = group_call_id_
      , text          = text_
      }
        = A.object
          [ "@type"         A..= AT.String "sendGroupCallMessage"
          , "group_call_id" A..= group_call_id_
          , "text"          A..= text_
          ]

defaultSendGroupCallMessage :: SendGroupCallMessage
defaultSendGroupCallMessage =
  SendGroupCallMessage
    { group_call_id = Nothing
    , text          = Nothing
    }

