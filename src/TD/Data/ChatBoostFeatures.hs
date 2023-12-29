module TD.Data.ChatBoostFeatures
  (ChatBoostFeatures(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatBoostLevelFeatures as ChatBoostLevelFeatures

data ChatBoostFeatures
  = ChatBoostFeatures -- ^ Contains a list of features available on the first chat boost levels
    { features :: Maybe [ChatBoostLevelFeatures.ChatBoostLevelFeatures] -- ^ The list of features
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostFeatures where
  shortShow ChatBoostFeatures
    { features = features_
    }
      = "ChatBoostFeatures"
        ++ I.cc
        [ "features" `I.p` features_
        ]

instance AT.FromJSON ChatBoostFeatures where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostFeatures" -> parseChatBoostFeatures v
      _                   -> mempty
    
    where
      parseChatBoostFeatures :: A.Value -> AT.Parser ChatBoostFeatures
      parseChatBoostFeatures = A.withObject "ChatBoostFeatures" $ \o -> do
        features_ <- o A..:?  "features"
        pure $ ChatBoostFeatures
          { features = features_
          }
  parseJSON _ = mempty

