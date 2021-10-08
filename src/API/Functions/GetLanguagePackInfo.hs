-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization 
-- 
-- __language_pack_id__ Language pack identifier
data GetLanguagePackInfo = 

 GetLanguagePackInfo { language_pack_id :: Maybe String }  deriving (Eq)

instance Show GetLanguagePackInfo where
 show GetLanguagePackInfo { language_pack_id=language_pack_id } =
  "GetLanguagePackInfo" ++ cc [p "language_pack_id" language_pack_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetLanguagePackInfo where
 toJSON GetLanguagePackInfo { language_pack_id = language_pack_id } =
  A.object [ "@type" A..= T.String "getLanguagePackInfo", "language_pack_id" A..= language_pack_id ]

instance T.FromJSON GetLanguagePackInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLanguagePackInfo" -> parseGetLanguagePackInfo v
   _ -> mempty
  where
   parseGetLanguagePackInfo :: A.Value -> T.Parser GetLanguagePackInfo
   parseGetLanguagePackInfo = A.withObject "GetLanguagePackInfo" $ \o -> do
    language_pack_id <- o A..:? "language_pack_id"
    return $ GetLanguagePackInfo { language_pack_id = language_pack_id }
 parseJSON _ = mempty
