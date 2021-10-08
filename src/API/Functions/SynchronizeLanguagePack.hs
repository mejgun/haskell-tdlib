-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SynchronizeLanguagePack where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization 
-- 
-- __language_pack_id__ Language pack identifier
data SynchronizeLanguagePack = 

 SynchronizeLanguagePack { language_pack_id :: Maybe String }  deriving (Eq)

instance Show SynchronizeLanguagePack where
 show SynchronizeLanguagePack { language_pack_id=language_pack_id } =
  "SynchronizeLanguagePack" ++ cc [p "language_pack_id" language_pack_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SynchronizeLanguagePack where
 toJSON SynchronizeLanguagePack { language_pack_id = language_pack_id } =
  A.object [ "@type" A..= T.String "synchronizeLanguagePack", "language_pack_id" A..= language_pack_id ]

instance T.FromJSON SynchronizeLanguagePack where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "synchronizeLanguagePack" -> parseSynchronizeLanguagePack v
   _ -> mempty
  where
   parseSynchronizeLanguagePack :: A.Value -> T.Parser SynchronizeLanguagePack
   parseSynchronizeLanguagePack = A.withObject "SynchronizeLanguagePack" $ \o -> do
    language_pack_id <- o A..:? "language_pack_id"
    return $ SynchronizeLanguagePack { language_pack_id = language_pack_id }
 parseJSON _ = mempty
