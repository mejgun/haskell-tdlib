module TD.Data.DiceStickers
  (DiceStickers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker

-- | Contains animated stickers which must be used for dice animation rendering
data DiceStickers
  = DiceStickersRegular -- ^ A regular animated sticker
    { sticker :: Maybe Sticker.Sticker -- ^ The animated sticker with the dice animation
    }
  | DiceStickersSlotMachine -- ^ Animated stickers to be combined into a slot machine
    { background  :: Maybe Sticker.Sticker -- ^ The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
    , lever       :: Maybe Sticker.Sticker -- ^ The animated sticker with the lever animation. The lever animation must play once in the initial dice state
    , left_reel   :: Maybe Sticker.Sticker -- ^ The animated sticker with the left reel
    , center_reel :: Maybe Sticker.Sticker -- ^ The animated sticker with the center reel
    , right_reel  :: Maybe Sticker.Sticker -- ^ The animated sticker with the right reel
    }
  deriving (Eq, Show)

instance I.ShortShow DiceStickers where
  shortShow DiceStickersRegular
    { sticker = sticker_
    }
      = "DiceStickersRegular"
        ++ I.cc
        [ "sticker" `I.p` sticker_
        ]
  shortShow DiceStickersSlotMachine
    { background  = background_
    , lever       = lever_
    , left_reel   = left_reel_
    , center_reel = center_reel_
    , right_reel  = right_reel_
    }
      = "DiceStickersSlotMachine"
        ++ I.cc
        [ "background"  `I.p` background_
        , "lever"       `I.p` lever_
        , "left_reel"   `I.p` left_reel_
        , "center_reel" `I.p` center_reel_
        , "right_reel"  `I.p` right_reel_
        ]

instance AT.FromJSON DiceStickers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "diceStickersRegular"     -> parseDiceStickersRegular v
      "diceStickersSlotMachine" -> parseDiceStickersSlotMachine v
      _                         -> mempty
    
    where
      parseDiceStickersRegular :: A.Value -> AT.Parser DiceStickers
      parseDiceStickersRegular = A.withObject "DiceStickersRegular" $ \o -> do
        sticker_ <- o A..:?  "sticker"
        pure $ DiceStickersRegular
          { sticker = sticker_
          }
      parseDiceStickersSlotMachine :: A.Value -> AT.Parser DiceStickers
      parseDiceStickersSlotMachine = A.withObject "DiceStickersSlotMachine" $ \o -> do
        background_  <- o A..:?  "background"
        lever_       <- o A..:?  "lever"
        left_reel_   <- o A..:?  "left_reel"
        center_reel_ <- o A..:?  "center_reel"
        right_reel_  <- o A..:?  "right_reel"
        pure $ DiceStickersSlotMachine
          { background  = background_
          , lever       = lever_
          , left_reel   = left_reel_
          , center_reel = center_reel_
          , right_reel  = right_reel_
          }
  parseJSON _ = mempty

