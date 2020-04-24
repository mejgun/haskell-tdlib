-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetLanguagePackInfo = 
 GetLanguagePackInfo { language_pack_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetLanguagePackInfo where
 toJSON (GetLanguagePackInfo { language_pack_id = language_pack_id }) =
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
    language_pack_id <- optional $ o A..: "language_pack_id"
    return $ GetLanguagePackInfo { language_pack_id = language_pack_id }