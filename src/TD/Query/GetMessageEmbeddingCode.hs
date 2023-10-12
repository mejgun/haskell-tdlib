module TD.Query.GetMessageEmbeddingCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetMessageEmbeddingCode -- ^ Returns an HTML code for embedding the message. Available only for messages in supergroups and channels with a username
  = GetMessageEmbeddingCode
    { chat_id    :: Maybe Int  -- ^ Identifier of the chat to which the message belongs
    , message_id :: Maybe Int  -- ^ Identifier of the message
    , for_album  :: Maybe Bool -- ^ Pass true to return an HTML code for embedding of the whole media album
    }
  deriving (Eq)

instance Show GetMessageEmbeddingCode where
  show
    GetMessageEmbeddingCode
      { chat_id    = chat_id_
      , message_id = message_id_
      , for_album  = for_album_
      }
        = "GetMessageEmbeddingCode"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "for_album"  `I.p` for_album_
          ]

instance AT.ToJSON GetMessageEmbeddingCode where
  toJSON
    GetMessageEmbeddingCode
      { chat_id    = chat_id_
      , message_id = message_id_
      , for_album  = for_album_
      }
        = A.object
          [ "@type"      A..= AT.String "getMessageEmbeddingCode"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "for_album"  A..= for_album_
          ]
