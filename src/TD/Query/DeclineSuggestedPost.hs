module TD.Query.DeclineSuggestedPost
  (DeclineSuggestedPost(..)
  , defaultDeclineSuggestedPost
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Declines a suggested post in a channel direct messages chat. Returns 'TD.Data.Ok.Ok'
data DeclineSuggestedPost
  = DeclineSuggestedPost
    { chat_id    :: Maybe Int    -- ^ Chat identifier of the channel direct messages chat
    , message_id :: Maybe Int    -- ^ Identifier of the message with the suggested post. Use messageProperties.can_be_declined to check whether the suggested post can be declined
    , comment    :: Maybe T.Text -- ^ Comment for the creator of the suggested post; 0-128 characters
    }
  deriving (Eq, Show)

instance I.ShortShow DeclineSuggestedPost where
  shortShow
    DeclineSuggestedPost
      { chat_id    = chat_id_
      , message_id = message_id_
      , comment    = comment_
      }
        = "DeclineSuggestedPost"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "comment"    `I.p` comment_
          ]

instance AT.ToJSON DeclineSuggestedPost where
  toJSON
    DeclineSuggestedPost
      { chat_id    = chat_id_
      , message_id = message_id_
      , comment    = comment_
      }
        = A.object
          [ "@type"      A..= AT.String "declineSuggestedPost"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "comment"    A..= comment_
          ]

defaultDeclineSuggestedPost :: DeclineSuggestedPost
defaultDeclineSuggestedPost =
  DeclineSuggestedPost
    { chat_id    = Nothing
    , message_id = Nothing
    , comment    = Nothing
    }

