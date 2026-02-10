module TD.Data.CraftGiftResult
  (CraftGiftResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGift as UpgradedGift
import qualified Data.Text as T

-- | Contains result of gift crafting
data CraftGiftResult
  = CraftGiftResultSuccess -- ^ Crafting was successful
    { gift             :: Maybe UpgradedGift.UpgradedGift -- ^ The created gift
    , received_gift_id :: Maybe T.Text                    -- ^ Unique identifier of the received gift for the current user
    }
  | CraftGiftResultTooEarly -- ^ Crafting isn't possible because one of the gifts can't be used for crafting yet
    { retry_after :: Maybe Int -- ^ Time left before the gift can be used for crafting
    }
  | CraftGiftResultInvalidGift -- ^ Crafting isn't possible because one of the gifts isn't suitable for crafting
  | CraftGiftResultFail -- ^ Crafting has failed
  deriving (Eq, Show)

instance I.ShortShow CraftGiftResult where
  shortShow CraftGiftResultSuccess
    { gift             = gift_
    , received_gift_id = received_gift_id_
    }
      = "CraftGiftResultSuccess"
        ++ I.cc
        [ "gift"             `I.p` gift_
        , "received_gift_id" `I.p` received_gift_id_
        ]
  shortShow CraftGiftResultTooEarly
    { retry_after = retry_after_
    }
      = "CraftGiftResultTooEarly"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]
  shortShow CraftGiftResultInvalidGift
      = "CraftGiftResultInvalidGift"
  shortShow CraftGiftResultFail
      = "CraftGiftResultFail"

instance AT.FromJSON CraftGiftResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "craftGiftResultSuccess"     -> parseCraftGiftResultSuccess v
      "craftGiftResultTooEarly"    -> parseCraftGiftResultTooEarly v
      "craftGiftResultInvalidGift" -> pure CraftGiftResultInvalidGift
      "craftGiftResultFail"        -> pure CraftGiftResultFail
      _                            -> mempty
    
    where
      parseCraftGiftResultSuccess :: A.Value -> AT.Parser CraftGiftResult
      parseCraftGiftResultSuccess = A.withObject "CraftGiftResultSuccess" $ \o -> do
        gift_             <- o A..:?  "gift"
        received_gift_id_ <- o A..:?  "received_gift_id"
        pure $ CraftGiftResultSuccess
          { gift             = gift_
          , received_gift_id = received_gift_id_
          }
      parseCraftGiftResultTooEarly :: A.Value -> AT.Parser CraftGiftResult
      parseCraftGiftResultTooEarly = A.withObject "CraftGiftResultTooEarly" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CraftGiftResultTooEarly
          { retry_after = retry_after_
          }
  parseJSON _ = mempty

