{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DiceStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Sticker as Sticker
import qualified Utils as U

-- | Contains animated stickers which must be used for dice animation rendering
data DiceStickers
  = -- | A regular animated sticker @sticker The animated sticker with the dice animation
    DiceStickersRegular
      { -- |
        sticker :: Maybe Sticker.Sticker
      }
  | -- | Animated stickers to be combined into a slot machine
    DiceStickersSlotMachine
      { -- | The animated sticker with the right reel
        right_reel :: Maybe Sticker.Sticker,
        -- | The animated sticker with the center reel
        center_reel :: Maybe Sticker.Sticker,
        -- | The animated sticker with the left reel
        left_reel :: Maybe Sticker.Sticker,
        -- | The animated sticker with the lever animation. The lever animation must play once in the initial dice state
        lever :: Maybe Sticker.Sticker,
        -- | The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
        background :: Maybe Sticker.Sticker
      }
  deriving (Eq)

instance Show DiceStickers where
  show
    DiceStickersRegular
      { sticker = sticker_
      } =
      "DiceStickersRegular"
        ++ U.cc
          [ U.p "sticker" sticker_
          ]
  show
    DiceStickersSlotMachine
      { right_reel = right_reel_,
        center_reel = center_reel_,
        left_reel = left_reel_,
        lever = lever_,
        background = background_
      } =
      "DiceStickersSlotMachine"
        ++ U.cc
          [ U.p "right_reel" right_reel_,
            U.p "center_reel" center_reel_,
            U.p "left_reel" left_reel_,
            U.p "lever" lever_,
            U.p "background" background_
          ]

instance T.FromJSON DiceStickers where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "diceStickersRegular" -> parseDiceStickersRegular v
      "diceStickersSlotMachine" -> parseDiceStickersSlotMachine v
      _ -> mempty
    where
      parseDiceStickersRegular :: A.Value -> T.Parser DiceStickers
      parseDiceStickersRegular = A.withObject "DiceStickersRegular" $ \o -> do
        sticker_ <- o A..:? "sticker"
        return $ DiceStickersRegular {sticker = sticker_}

      parseDiceStickersSlotMachine :: A.Value -> T.Parser DiceStickers
      parseDiceStickersSlotMachine = A.withObject "DiceStickersSlotMachine" $ \o -> do
        right_reel_ <- o A..:? "right_reel"
        center_reel_ <- o A..:? "center_reel"
        left_reel_ <- o A..:? "left_reel"
        lever_ <- o A..:? "lever"
        background_ <- o A..:? "background"
        return $ DiceStickersSlotMachine {right_reel = right_reel_, center_reel = center_reel_, left_reel = left_reel_, lever = lever_, background = background_}
  parseJSON _ = mempty

instance T.ToJSON DiceStickers where
  toJSON
    DiceStickersRegular
      { sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "diceStickersRegular",
          "sticker" A..= sticker_
        ]
  toJSON
    DiceStickersSlotMachine
      { right_reel = right_reel_,
        center_reel = center_reel_,
        left_reel = left_reel_,
        lever = lever_,
        background = background_
      } =
      A.object
        [ "@type" A..= T.String "diceStickersSlotMachine",
          "right_reel" A..= right_reel_,
          "center_reel" A..= center_reel_,
          "left_reel" A..= left_reel_,
          "lever" A..= lever_,
          "background" A..= background_
        ]
