-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAllPassportElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetAllPassportElements = 
 GetAllPassportElements { password :: String }  -- deriving (Show)

instance T.ToJSON GetAllPassportElements where
 toJSON (GetAllPassportElements { password = password }) =
  A.object [ "@type" A..= T.String "getAllPassportElements", "password" A..= password ]
-- getAllPassportElements GetAllPassportElements  { password :: String } 



instance T.FromJSON GetAllPassportElements where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAllPassportElements" -> parseGetAllPassportElements v
  where
   parseGetAllPassportElements :: A.Value -> T.Parser GetAllPassportElements
   parseGetAllPassportElements = A.withObject "GetAllPassportElements" $ \o -> do
    password <- o A..: "password"
    return $ GetAllPassportElements { password = password }