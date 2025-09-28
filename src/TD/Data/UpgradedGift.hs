module TD.Data.UpgradedGift
  (UpgradedGift(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.UpgradedGiftModel as UpgradedGiftModel
import qualified TD.Data.UpgradedGiftSymbol as UpgradedGiftSymbol
import qualified TD.Data.UpgradedGiftBackdrop as UpgradedGiftBackdrop
import qualified TD.Data.UpgradedGiftOriginalDetails as UpgradedGiftOriginalDetails
import qualified TD.Data.GiftResaleParameters as GiftResaleParameters

data UpgradedGift
  = UpgradedGift -- ^ Describes an upgraded gift that can be transferred to another owner or transferred to the TON blockchain as an NFT
    { _id                  :: Maybe Int                                                     -- ^ Unique identifier of the gift
    , regular_gift_id      :: Maybe Int                                                     -- ^ Unique identifier of the regular gift from which the gift was upgraded; may be 0 for short period of time for old gifts from database
    , publisher_chat_id    :: Maybe Int                                                     -- ^ Identifier of the chat that published the gift; 0 if none
    , title                :: Maybe T.Text                                                  -- ^ The title of the upgraded gift
    , name                 :: Maybe T.Text                                                  -- ^ Unique name of the upgraded gift that can be used with internalLinkTypeUpgradedGift or sendResoldGift
    , number               :: Maybe Int                                                     -- ^ Unique number of the upgraded gift among gifts upgraded from the same gift
    , total_upgraded_count :: Maybe Int                                                     -- ^ Total number of gifts that were upgraded from the same gift
    , max_upgraded_count   :: Maybe Int                                                     -- ^ The maximum number of gifts that can be upgraded from the same gift
    , is_premium           :: Maybe Bool                                                    -- ^ True, if the original gift could have been bought only by Telegram Premium subscribers
    , is_theme_available   :: Maybe Bool                                                    -- ^ True, if the gift can be used to set a theme in a chat
    , used_theme_chat_id   :: Maybe Int                                                     -- ^ Identifier of the chat for which the gift is used to set a theme; 0 if none or the gift isn't owned by the current user
    , owner_id             :: Maybe MessageSender.MessageSender                             -- ^ Identifier of the user or the chat that owns the upgraded gift; may be null if none or unknown
    , owner_address        :: Maybe T.Text                                                  -- ^ Address of the gift NFT owner in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address
    , owner_name           :: Maybe T.Text                                                  -- ^ Name of the owner for the case when owner identifier and address aren't known
    , gift_address         :: Maybe T.Text                                                  -- ^ Address of the gift NFT in TON blockchain; may be empty if none. Append the address to getOption("ton_blockchain_explorer_url") to get a link with information about the address
    , model                :: Maybe UpgradedGiftModel.UpgradedGiftModel                     -- ^ Model of the upgraded gift
    , symbol               :: Maybe UpgradedGiftSymbol.UpgradedGiftSymbol                   -- ^ Symbol of the upgraded gift
    , backdrop             :: Maybe UpgradedGiftBackdrop.UpgradedGiftBackdrop               -- ^ Backdrop of the upgraded gift
    , original_details     :: Maybe UpgradedGiftOriginalDetails.UpgradedGiftOriginalDetails -- ^ Information about the originally sent gift; may be null if unknown
    , resale_parameters    :: Maybe GiftResaleParameters.GiftResaleParameters               -- ^ Resale parameters of the gift; may be null if resale isn't possible
    , value_currency       :: Maybe T.Text                                                  -- ^ ISO 4217 currency code of the currency in which value of the gift is represented; may be empty if unavailable
    , value_amount         :: Maybe Int                                                     -- ^ Estimated value of the gift; in the smallest units of the currency; 0 if unavailable
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGift where
  shortShow UpgradedGift
    { _id                  = _id_
    , regular_gift_id      = regular_gift_id_
    , publisher_chat_id    = publisher_chat_id_
    , title                = title_
    , name                 = name_
    , number               = number_
    , total_upgraded_count = total_upgraded_count_
    , max_upgraded_count   = max_upgraded_count_
    , is_premium           = is_premium_
    , is_theme_available   = is_theme_available_
    , used_theme_chat_id   = used_theme_chat_id_
    , owner_id             = owner_id_
    , owner_address        = owner_address_
    , owner_name           = owner_name_
    , gift_address         = gift_address_
    , model                = model_
    , symbol               = symbol_
    , backdrop             = backdrop_
    , original_details     = original_details_
    , resale_parameters    = resale_parameters_
    , value_currency       = value_currency_
    , value_amount         = value_amount_
    }
      = "UpgradedGift"
        ++ I.cc
        [ "_id"                  `I.p` _id_
        , "regular_gift_id"      `I.p` regular_gift_id_
        , "publisher_chat_id"    `I.p` publisher_chat_id_
        , "title"                `I.p` title_
        , "name"                 `I.p` name_
        , "number"               `I.p` number_
        , "total_upgraded_count" `I.p` total_upgraded_count_
        , "max_upgraded_count"   `I.p` max_upgraded_count_
        , "is_premium"           `I.p` is_premium_
        , "is_theme_available"   `I.p` is_theme_available_
        , "used_theme_chat_id"   `I.p` used_theme_chat_id_
        , "owner_id"             `I.p` owner_id_
        , "owner_address"        `I.p` owner_address_
        , "owner_name"           `I.p` owner_name_
        , "gift_address"         `I.p` gift_address_
        , "model"                `I.p` model_
        , "symbol"               `I.p` symbol_
        , "backdrop"             `I.p` backdrop_
        , "original_details"     `I.p` original_details_
        , "resale_parameters"    `I.p` resale_parameters_
        , "value_currency"       `I.p` value_currency_
        , "value_amount"         `I.p` value_amount_
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
        regular_gift_id_      <- fmap I.readInt64 <$> o A..:?  "regular_gift_id"
        publisher_chat_id_    <- o A..:?                       "publisher_chat_id"
        title_                <- o A..:?                       "title"
        name_                 <- o A..:?                       "name"
        number_               <- o A..:?                       "number"
        total_upgraded_count_ <- o A..:?                       "total_upgraded_count"
        max_upgraded_count_   <- o A..:?                       "max_upgraded_count"
        is_premium_           <- o A..:?                       "is_premium"
        is_theme_available_   <- o A..:?                       "is_theme_available"
        used_theme_chat_id_   <- o A..:?                       "used_theme_chat_id"
        owner_id_             <- o A..:?                       "owner_id"
        owner_address_        <- o A..:?                       "owner_address"
        owner_name_           <- o A..:?                       "owner_name"
        gift_address_         <- o A..:?                       "gift_address"
        model_                <- o A..:?                       "model"
        symbol_               <- o A..:?                       "symbol"
        backdrop_             <- o A..:?                       "backdrop"
        original_details_     <- o A..:?                       "original_details"
        resale_parameters_    <- o A..:?                       "resale_parameters"
        value_currency_       <- o A..:?                       "value_currency"
        value_amount_         <- o A..:?                       "value_amount"
        pure $ UpgradedGift
          { _id                  = _id_
          , regular_gift_id      = regular_gift_id_
          , publisher_chat_id    = publisher_chat_id_
          , title                = title_
          , name                 = name_
          , number               = number_
          , total_upgraded_count = total_upgraded_count_
          , max_upgraded_count   = max_upgraded_count_
          , is_premium           = is_premium_
          , is_theme_available   = is_theme_available_
          , used_theme_chat_id   = used_theme_chat_id_
          , owner_id             = owner_id_
          , owner_address        = owner_address_
          , owner_name           = owner_name_
          , gift_address         = gift_address_
          , model                = model_
          , symbol               = symbol_
          , backdrop             = backdrop_
          , original_details     = original_details_
          , resale_parameters    = resale_parameters_
          , value_currency       = value_currency_
          , value_amount         = value_amount_
          }
  parseJSON _ = mempty

