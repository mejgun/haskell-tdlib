module TD.Data.UpgradedGiftModelCount
  (UpgradedGiftModelCount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGiftModel as UpgradedGiftModel

data UpgradedGiftModelCount
  = UpgradedGiftModelCount -- ^ Describes a model of an upgraded gift with the number of gifts found
    { model       :: Maybe UpgradedGiftModel.UpgradedGiftModel -- ^ The model
    , total_count :: Maybe Int                                 -- ^ Total number of gifts with the model
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftModelCount where
  shortShow UpgradedGiftModelCount
    { model       = model_
    , total_count = total_count_
    }
      = "UpgradedGiftModelCount"
        ++ I.cc
        [ "model"       `I.p` model_
        , "total_count" `I.p` total_count_
        ]

instance AT.FromJSON UpgradedGiftModelCount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftModelCount" -> parseUpgradedGiftModelCount v
      _                        -> mempty
    
    where
      parseUpgradedGiftModelCount :: A.Value -> AT.Parser UpgradedGiftModelCount
      parseUpgradedGiftModelCount = A.withObject "UpgradedGiftModelCount" $ \o -> do
        model_       <- o A..:?  "model"
        total_count_ <- o A..:?  "total_count"
        pure $ UpgradedGiftModelCount
          { model       = model_
          , total_count = total_count_
          }
  parseJSON _ = mempty

