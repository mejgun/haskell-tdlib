module TD.Data.UpgradedGift
  (UpgradedGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.UpgradedGiftModel as UpgradedGiftModel
import qualified TD.Data.UpgradedGiftSymbol as UpgradedGiftSymbol
import qualified TD.Data.UpgradedGiftBackdrop as UpgradedGiftBackdrop
import qualified TD.Data.UpgradedGiftOriginalDetails as UpgradedGiftOriginalDetails

data UpgradedGift
  = UpgradedGift -- ^ Describes an upgraded gift that can be gifted to another user or transferred to TON blockchain as an NFT
    { _id                  :: Maybe Int                                                     -- ^ Unique identifier of the gift
    , title                :: Maybe T.Text                                                  -- ^ The title of the upgraded gift
    , number               :: Maybe Int                                                     -- ^ Unique number of the upgraded gift among gifts upgraded from the same gift
    , total_upgraded_count :: Maybe Int                                                     -- ^ Total number of gifts that were upgraded from the same gift
    , max_upgraded_count   :: Maybe Int                                                     -- ^ The maximum number of gifts that can be upgraded from the same gift
    , owner_user_id        :: Maybe Int                                                     -- ^ User identifier of the user that owns the upgraded gift; 0 if none
    , model                :: Maybe UpgradedGiftModel.UpgradedGiftModel                     -- ^ Model of the upgraded gift
    , symbol               :: Maybe UpgradedGiftSymbol.UpgradedGiftSymbol                   -- ^ Symbol of the upgraded gift
    , backdrop             :: Maybe UpgradedGiftBackdrop.UpgradedGiftBackdrop               -- ^ Backdrop of the upgraded gift
    , original_details     :: Maybe UpgradedGiftOriginalDetails.UpgradedGiftOriginalDetails -- ^ Information about the originally sent gift; may be null if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGift where
  shortShow UpgradedGift
    { _id                  = _id_
    , title                = title_
    , number               = number_
    , total_upgraded_count = total_upgraded_count_
    , max_upgraded_count   = max_upgraded_count_
    , owner_user_id        = owner_user_id_
    , model                = model_
    , symbol               = symbol_
    , backdrop             = backdrop_
    , original_details     = original_details_
    }
      = "UpgradedGift"
        ++ I.cc
        [ "_id"                  `I.p` _id_
        , "title"                `I.p` title_
        , "number"               `I.p` number_
        , "total_upgraded_count" `I.p` total_upgraded_count_
        , "max_upgraded_count"   `I.p` max_upgraded_count_
        , "owner_user_id"        `I.p` owner_user_id_
        , "model"                `I.p` model_
        , "symbol"               `I.p` symbol_
        , "backdrop"             `I.p` backdrop_
        , "original_details"     `I.p` original_details_
        ]

instance AT.FromJSON UpgradedGift where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGift" -> parseUpgradedGift v
      _              -> mempty
    
    where
      parseUpgradedGift :: A.Value -> AT.Parser UpgradedGift
      parseUpgradedGift = A.withObject "UpgradedGift" $ \o -> do
        _id_                  <- fmap I.readInt64 <$> o A..:?  "id"
        title_                <- o A..:?                       "title"
        number_               <- o A..:?                       "number"
        total_upgraded_count_ <- o A..:?                       "total_upgraded_count"
        max_upgraded_count_   <- o A..:?                       "max_upgraded_count"
        owner_user_id_        <- o A..:?                       "owner_user_id"
        model_                <- o A..:?                       "model"
        symbol_               <- o A..:?                       "symbol"
        backdrop_             <- o A..:?                       "backdrop"
        original_details_     <- o A..:?                       "original_details"
        pure $ UpgradedGift
          { _id                  = _id_
          , title                = title_
          , number               = number_
          , total_upgraded_count = total_upgraded_count_
          , max_upgraded_count   = max_upgraded_count_
          , owner_user_id        = owner_user_id_
          , model                = model_
          , symbol               = symbol_
          , backdrop             = backdrop_
          , original_details     = original_details_
          }
  parseJSON _ = mempty

