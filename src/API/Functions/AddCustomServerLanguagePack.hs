-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddCustomServerLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddCustomServerLanguagePack = 
 AddCustomServerLanguagePack { language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON AddCustomServerLanguagePack where
 toJSON (AddCustomServerLanguagePack { language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "addCustomServerLanguagePack", "language_pack_id" A..= language_pack_id ]
-- addCustomServerLanguagePack AddCustomServerLanguagePack  { language_pack_id :: String } 



instance T.FromJSON AddCustomServerLanguagePack where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addCustomServerLanguagePack" -> parseAddCustomServerLanguagePack v
  where
   parseAddCustomServerLanguagePack :: A.Value -> T.Parser AddCustomServerLanguagePack
   parseAddCustomServerLanguagePack = A.withObject "AddCustomServerLanguagePack" $ \o -> do
    language_pack_id <- o A..: "language_pack_id"
    return $ AddCustomServerLanguagePack { language_pack_id = language_pack_id }