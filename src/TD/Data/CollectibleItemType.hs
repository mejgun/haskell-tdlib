module TD.Data.CollectibleItemType
  (CollectibleItemType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a collectible item that can be purchased at https://fragment.com
data CollectibleItemType
  = CollectibleItemTypeUsername -- ^ A username
    { username :: Maybe T.Text -- ^ The username
    }
  | CollectibleItemTypePhoneNumber -- ^ A phone number
    { phone_number :: Maybe T.Text -- ^ The phone number
    }
  deriving (Eq, Show)

instance I.ShortShow CollectibleItemType where
  shortShow CollectibleItemTypeUsername
    { username = username_
    }
      = "CollectibleItemTypeUsername"
        ++ I.cc
        [ "username" `I.p` username_
        ]
  shortShow CollectibleItemTypePhoneNumber
    { phone_number = phone_number_
    }
      = "CollectibleItemTypePhoneNumber"
        ++ I.cc
        [ "phone_number" `I.p` phone_number_
        ]

instance AT.FromJSON CollectibleItemType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "collectibleItemTypeUsername"    -> parseCollectibleItemTypeUsername v
      "collectibleItemTypePhoneNumber" -> parseCollectibleItemTypePhoneNumber v
      _                                -> mempty
    
    where
      parseCollectibleItemTypeUsername :: A.Value -> AT.Parser CollectibleItemType
      parseCollectibleItemTypeUsername = A.withObject "CollectibleItemTypeUsername" $ \o -> do
        username_ <- o A..:?  "username"
        pure $ CollectibleItemTypeUsername
          { username = username_
          }
      parseCollectibleItemTypePhoneNumber :: A.Value -> AT.Parser CollectibleItemType
      parseCollectibleItemTypePhoneNumber = A.withObject "CollectibleItemTypePhoneNumber" $ \o -> do
        phone_number_ <- o A..:?  "phone_number"
        pure $ CollectibleItemTypePhoneNumber
          { phone_number = phone_number_
          }
  parseJSON _ = mempty

instance AT.ToJSON CollectibleItemType where
  toJSON CollectibleItemTypeUsername
    { username = username_
    }
      = A.object
        [ "@type"    A..= AT.String "collectibleItemTypeUsername"
        , "username" A..= username_
        ]
  toJSON CollectibleItemTypePhoneNumber
    { phone_number = phone_number_
    }
      = A.object
        [ "@type"        A..= AT.String "collectibleItemTypePhoneNumber"
        , "phone_number" A..= phone_number_
        ]

