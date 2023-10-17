module TD.Data.PushReceiverId
  (PushReceiverId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data PushReceiverId
  = PushReceiverId -- ^ Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification
    { _id :: Maybe Int -- ^ The globally unique identifier of push notification subscription
    }
  deriving (Eq, Show)

instance I.ShortShow PushReceiverId where
  shortShow PushReceiverId
    { _id = _id_
    }
      = "PushReceiverId"
        ++ I.cc
        [ "_id" `I.p` _id_
        ]

instance AT.FromJSON PushReceiverId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pushReceiverId" -> parsePushReceiverId v
      _                -> mempty
    
    where
      parsePushReceiverId :: A.Value -> AT.Parser PushReceiverId
      parsePushReceiverId = A.withObject "PushReceiverId" $ \o -> do
        _id_ <- fmap I.readInt64 <$> o A..:?  "id"
        pure $ PushReceiverId
          { _id = _id_
          }
  parseJSON _ = mempty

