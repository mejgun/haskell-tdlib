-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAllPassportElements where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetAllPassportElements = 
 GetAllPassportElements { password :: Maybe String }  deriving (Show)

instance T.ToJSON GetAllPassportElements where
 toJSON (GetAllPassportElements { password = password }) =
  A.object [ "@type" A..= T.String "getAllPassportElements", "password" A..= password ]

instance T.FromJSON GetAllPassportElements where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAllPassportElements" -> parseGetAllPassportElements v
   _ -> mempty
  where
   parseGetAllPassportElements :: A.Value -> T.Parser GetAllPassportElements
   parseGetAllPassportElements = A.withObject "GetAllPassportElements" $ \o -> do
    password <- optional $ o A..: "password"
    return $ GetAllPassportElements { password = password }