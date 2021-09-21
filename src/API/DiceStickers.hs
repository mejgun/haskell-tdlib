-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DiceStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Sticker as Sticker

-- |
-- 
-- Contains animated stickers which should be used for dice animation rendering
data DiceStickers = 
 -- |
 -- 
 -- A regular animated sticker 
 -- 
 -- __sticker__ The animated sticker with the dice animation
 DiceStickersRegular { sticker :: Maybe Sticker.Sticker }  |
 -- |
 -- 
 -- Animated stickers to be combined into a slot machine
 -- 
 -- __background__ The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
 -- 
 -- __lever__ The animated sticker with the lever animation. The lever animation must play once in the initial dice state
 -- 
 -- __left_reel__ The animated sticker with the left reel
 -- 
 -- __center_reel__ The animated sticker with the center reel
 -- 
 -- __right_reel__ The animated sticker with the right reel
 DiceStickersSlotMachine { right_reel :: Maybe Sticker.Sticker, center_reel :: Maybe Sticker.Sticker, left_reel :: Maybe Sticker.Sticker, lever :: Maybe Sticker.Sticker, background :: Maybe Sticker.Sticker }  deriving (Show, Eq)

instance T.ToJSON DiceStickers where
 toJSON (DiceStickersRegular { sticker = sticker }) =
  A.object [ "@type" A..= T.String "diceStickersRegular", "sticker" A..= sticker ]

 toJSON (DiceStickersSlotMachine { right_reel = right_reel, center_reel = center_reel, left_reel = left_reel, lever = lever, background = background }) =
  A.object [ "@type" A..= T.String "diceStickersSlotMachine", "right_reel" A..= right_reel, "center_reel" A..= center_reel, "left_reel" A..= left_reel, "lever" A..= lever, "background" A..= background ]

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
    sticker <- o A..:? "sticker"
    return $ DiceStickersRegular { sticker = sticker }

   parseDiceStickersSlotMachine :: A.Value -> T.Parser DiceStickers
   parseDiceStickersSlotMachine = A.withObject "DiceStickersSlotMachine" $ \o -> do
    right_reel <- o A..:? "right_reel"
    center_reel <- o A..:? "center_reel"
    left_reel <- o A..:? "left_reel"
    lever <- o A..:? "lever"
    background <- o A..:? "background"
    return $ DiceStickersSlotMachine { right_reel = right_reel, center_reel = center_reel, left_reel = left_reel, lever = lever, background = background }