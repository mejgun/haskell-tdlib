-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteLanguagePack = 
 DeleteLanguagePack { language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON DeleteLanguagePack where
 toJSON (DeleteLanguagePack { language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "deleteLanguagePack", "language_pack_id" A..= language_pack_id ]
-- deleteLanguagePack DeleteLanguagePack  { language_pack_id :: String } 



instance T.FromJSON DeleteLanguagePack where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteLanguagePack" -> parseDeleteLanguagePack v
  where
   parseDeleteLanguagePack :: A.Value -> T.Parser DeleteLanguagePack
   parseDeleteLanguagePack = A.withObject "DeleteLanguagePack" $ \o -> do
    language_pack_id <- o A..: "language_pack_id"
    return $ DeleteLanguagePack { language_pack_id = language_pack_id }