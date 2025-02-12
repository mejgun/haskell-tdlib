module TD.Data.PaidReactionType
  (PaidReactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of paid message reaction
data PaidReactionType
  = PaidReactionTypeRegular -- ^ A paid reaction on behalf of the current user
  | PaidReactionTypeAnonymous -- ^ An anonymous paid reaction
  | PaidReactionTypeChat -- ^ A paid reaction on behalf of an owned chat
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  deriving (Eq, Show)

instance I.ShortShow PaidReactionType where
  shortShow PaidReactionTypeRegular
      = "PaidReactionTypeRegular"
  shortShow PaidReactionTypeAnonymous
      = "PaidReactionTypeAnonymous"
  shortShow PaidReactionTypeChat
    { chat_id = chat_id_
    }
      = "PaidReactionTypeChat"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]

instance AT.FromJSON PaidReactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paidReactionTypeRegular"   -> pure PaidReactionTypeRegular
      "paidReactionTypeAnonymous" -> pure PaidReactionTypeAnonymous
      "paidReactionTypeChat"      -> parsePaidReactionTypeChat v
      _                           -> mempty
    
    where
      parsePaidReactionTypeChat :: A.Value -> AT.Parser PaidReactionType
      parsePaidReactionTypeChat = A.withObject "PaidReactionTypeChat" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ PaidReactionTypeChat
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON PaidReactionType where
  toJSON PaidReactionTypeRegular
      = A.object
        [ "@type" A..= AT.String "paidReactionTypeRegular"
        ]
  toJSON PaidReactionTypeAnonymous
      = A.object
        [ "@type" A..= AT.String "paidReactionTypeAnonymous"
        ]
  toJSON PaidReactionTypeChat
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "paidReactionTypeChat"
        , "chat_id" A..= chat_id_
        ]

