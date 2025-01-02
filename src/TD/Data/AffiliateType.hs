module TD.Data.AffiliateType
  (AffiliateType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of affiliate for an affiliate program
data AffiliateType
  = AffiliateTypeCurrentUser -- ^ The affiliate is the current user
  | AffiliateTypeBot -- ^ The affiliate is a bot owned by the current user
    { user_id :: Maybe Int -- ^ User identifier of the bot
    }
  | AffiliateTypeChannel -- ^ The affiliate is a channel chat where the current user has can_post_messages administrator right
    { chat_id :: Maybe Int -- ^ Identifier of the channel chat
    }
  deriving (Eq, Show)

instance I.ShortShow AffiliateType where
  shortShow AffiliateTypeCurrentUser
      = "AffiliateTypeCurrentUser"
  shortShow AffiliateTypeBot
    { user_id = user_id_
    }
      = "AffiliateTypeBot"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow AffiliateTypeChannel
    { chat_id = chat_id_
    }
      = "AffiliateTypeChannel"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]

instance AT.FromJSON AffiliateType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "affiliateTypeCurrentUser" -> pure AffiliateTypeCurrentUser
      "affiliateTypeBot"         -> parseAffiliateTypeBot v
      "affiliateTypeChannel"     -> parseAffiliateTypeChannel v
      _                          -> mempty
    
    where
      parseAffiliateTypeBot :: A.Value -> AT.Parser AffiliateType
      parseAffiliateTypeBot = A.withObject "AffiliateTypeBot" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ AffiliateTypeBot
          { user_id = user_id_
          }
      parseAffiliateTypeChannel :: A.Value -> AT.Parser AffiliateType
      parseAffiliateTypeChannel = A.withObject "AffiliateTypeChannel" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ AffiliateTypeChannel
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON AffiliateType where
  toJSON AffiliateTypeCurrentUser
      = A.object
        [ "@type" A..= AT.String "affiliateTypeCurrentUser"
        ]
  toJSON AffiliateTypeBot
    { user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "affiliateTypeBot"
        , "user_id" A..= user_id_
        ]
  toJSON AffiliateTypeChannel
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "affiliateTypeChannel"
        , "chat_id" A..= chat_id_
        ]

