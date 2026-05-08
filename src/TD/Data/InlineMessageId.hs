module TD.Data.InlineMessageId
  (InlineMessageId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data InlineMessageId
  = InlineMessageId -- ^ Contains identifier of a sent guest message
    { _id :: Maybe T.Text -- ^ Unique identifier for the message
    }
  deriving (Eq, Show)

instance I.ShortShow InlineMessageId where
  shortShow InlineMessageId
    { _id = _id_
    }
      = "InlineMessageId"
        ++ I.cc
        [ "_id" `I.p` _id_
        ]

instance AT.FromJSON InlineMessageId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineMessageId" -> parseInlineMessageId v
      _                 -> mempty
    
    where
      parseInlineMessageId :: A.Value -> AT.Parser InlineMessageId
      parseInlineMessageId = A.withObject "InlineMessageId" $ \o -> do
        _id_ <- o A..:?  "id"
        pure $ InlineMessageId
          { _id = _id_
          }
  parseJSON _ = mempty

