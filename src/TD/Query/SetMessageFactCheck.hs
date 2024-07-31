module TD.Query.SetMessageFactCheck
  (SetMessageFactCheck(..)
  , defaultSetMessageFactCheck
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Changes the fact-check of a message. Can be only used if messageProperties.can_set_fact_check == true. Returns 'TD.Data.Ok.Ok'
data SetMessageFactCheck
  = SetMessageFactCheck
    { chat_id    :: Maybe Int                         -- ^ The channel chat the message belongs to
    , message_id :: Maybe Int                         -- ^ Identifier of the message
    , text       :: Maybe FormattedText.FormattedText -- ^ New text of the fact-check; 0-getOption("fact_check_length_max") characters; pass null to remove it. Only Bold, Italic, and TextUrl entities with https://t.me/ links are supported
    }
  deriving (Eq, Show)

instance I.ShortShow SetMessageFactCheck where
  shortShow
    SetMessageFactCheck
      { chat_id    = chat_id_
      , message_id = message_id_
      , text       = text_
      }
        = "SetMessageFactCheck"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "text"       `I.p` text_
          ]

instance AT.ToJSON SetMessageFactCheck where
  toJSON
    SetMessageFactCheck
      { chat_id    = chat_id_
      , message_id = message_id_
      , text       = text_
      }
        = A.object
          [ "@type"      A..= AT.String "setMessageFactCheck"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "text"       A..= text_
          ]

defaultSetMessageFactCheck :: SetMessageFactCheck
defaultSetMessageFactCheck =
  SetMessageFactCheck
    { chat_id    = Nothing
    , message_id = Nothing
    , text       = Nothing
    }

