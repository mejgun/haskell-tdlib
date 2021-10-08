-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetSupergroupStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes the sticker set of a supergroup; requires can_change_info administrator right 
-- 
-- __supergroup_id__ Identifier of the supergroup
-- 
-- __sticker_set_id__ New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
data SetSupergroupStickerSet = 

 SetSupergroupStickerSet { sticker_set_id :: Maybe Int, supergroup_id :: Maybe Int }  deriving (Eq)

instance Show SetSupergroupStickerSet where
 show SetSupergroupStickerSet { sticker_set_id=sticker_set_id, supergroup_id=supergroup_id } =
  "SetSupergroupStickerSet" ++ cc [p "sticker_set_id" sticker_set_id, p "supergroup_id" supergroup_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetSupergroupStickerSet where
 toJSON SetSupergroupStickerSet { sticker_set_id = sticker_set_id, supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "setSupergroupStickerSet", "sticker_set_id" A..= sticker_set_id, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON SetSupergroupStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setSupergroupStickerSet" -> parseSetSupergroupStickerSet v
   _ -> mempty
  where
   parseSetSupergroupStickerSet :: A.Value -> T.Parser SetSupergroupStickerSet
   parseSetSupergroupStickerSet = A.withObject "SetSupergroupStickerSet" $ \o -> do
    sticker_set_id <- mconcat [ o A..:? "sticker_set_id", readMaybe <$> (o A..: "sticker_set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetSupergroupStickerSet { sticker_set_id = sticker_set_id, supergroup_id = supergroup_id }
 parseJSON _ = mempty
