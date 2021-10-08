-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeStickerSet where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Installs/uninstalls or activates/archives a sticker set 
-- 
-- __set_id__ Identifier of the sticker set
-- 
-- __is_installed__ The new value of is_installed
-- 
-- __is_archived__ The new value of is_archived. A sticker set can't be installed and archived simultaneously
data ChangeStickerSet = 

 ChangeStickerSet { is_archived :: Maybe Bool, is_installed :: Maybe Bool, set_id :: Maybe Int }  deriving (Eq)

instance Show ChangeStickerSet where
 show ChangeStickerSet { is_archived=is_archived, is_installed=is_installed, set_id=set_id } =
  "ChangeStickerSet" ++ cc [p "is_archived" is_archived, p "is_installed" is_installed, p "set_id" set_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChangeStickerSet where
 toJSON ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id } =
  A.object [ "@type" A..= T.String "changeStickerSet", "is_archived" A..= is_archived, "is_installed" A..= is_installed, "set_id" A..= set_id ]

instance T.FromJSON ChangeStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changeStickerSet" -> parseChangeStickerSet v
   _ -> mempty
  where
   parseChangeStickerSet :: A.Value -> T.Parser ChangeStickerSet
   parseChangeStickerSet = A.withObject "ChangeStickerSet" $ \o -> do
    is_archived <- o A..:? "is_archived"
    is_installed <- o A..:? "is_installed"
    set_id <- mconcat [ o A..:? "set_id", readMaybe <$> (o A..: "set_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id }
 parseJSON _ = mempty
