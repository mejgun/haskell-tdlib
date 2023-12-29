module TD.Data.PremiumGiftCodeInfo
  (PremiumGiftCodeInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data PremiumGiftCodeInfo
  = PremiumGiftCodeInfo -- ^ Contains information about a Telegram Premium gift code
    { creator_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of a chat or a user that created the gift code; may be null if unknown. If null and the code is from messagePremiumGiftCode message, then creator_id from the message can be used
    , creation_date       :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the code was created
    , is_from_giveaway    :: Maybe Bool                        -- ^ True, if the gift code was created for a giveaway
    , giveaway_message_id :: Maybe Int                         -- ^ Identifier of the corresponding giveaway message in the creator_id chat; can be 0 or an identifier of a deleted message
    , month_count         :: Maybe Int                         -- ^ Number of months the Telegram Premium subscription will be active after code activation
    , user_id             :: Maybe Int                         -- ^ Identifier of a user for which the code was created; 0 if none
    , use_date            :: Maybe Int                         -- ^ Point in time (Unix timestamp) when the code was activated; 0 if none
    }
  deriving (Eq, Show)

instance I.ShortShow PremiumGiftCodeInfo where
  shortShow PremiumGiftCodeInfo
    { creator_id          = creator_id_
    , creation_date       = creation_date_
    , is_from_giveaway    = is_from_giveaway_
    , giveaway_message_id = giveaway_message_id_
    , month_count         = month_count_
    , user_id             = user_id_
    , use_date            = use_date_
    }
      = "PremiumGiftCodeInfo"
        ++ I.cc
        [ "creator_id"          `I.p` creator_id_
        , "creation_date"       `I.p` creation_date_
        , "is_from_giveaway"    `I.p` is_from_giveaway_
        , "giveaway_message_id" `I.p` giveaway_message_id_
        , "month_count"         `I.p` month_count_
        , "user_id"             `I.p` user_id_
        , "use_date"            `I.p` use_date_
        ]

instance AT.FromJSON PremiumGiftCodeInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "premiumGiftCodeInfo" -> parsePremiumGiftCodeInfo v
      _                     -> mempty
    
    where
      parsePremiumGiftCodeInfo :: A.Value -> AT.Parser PremiumGiftCodeInfo
      parsePremiumGiftCodeInfo = A.withObject "PremiumGiftCodeInfo" $ \o -> do
        creator_id_          <- o A..:?  "creator_id"
        creation_date_       <- o A..:?  "creation_date"
        is_from_giveaway_    <- o A..:?  "is_from_giveaway"
        giveaway_message_id_ <- o A..:?  "giveaway_message_id"
        month_count_         <- o A..:?  "month_count"
        user_id_             <- o A..:?  "user_id"
        use_date_            <- o A..:?  "use_date"
        pure $ PremiumGiftCodeInfo
          { creator_id          = creator_id_
          , creation_date       = creation_date_
          , is_from_giveaway    = is_from_giveaway_
          , giveaway_message_id = giveaway_message_id_
          , month_count         = month_count_
          , user_id             = user_id_
          , use_date            = use_date_
          }
  parseJSON _ = mempty

