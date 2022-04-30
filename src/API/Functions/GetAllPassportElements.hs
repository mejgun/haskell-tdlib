-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAllPassportElements where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns all available Telegram Passport elements 
-- 
-- __password__ Password of the current user
data GetAllPassportElements = 

 GetAllPassportElements { password :: Maybe String }  deriving (Eq)

instance Show GetAllPassportElements where
 show GetAllPassportElements { password=password } =
  "GetAllPassportElements" ++ U.cc [U.p "password" password ]

instance T.ToJSON GetAllPassportElements where
 toJSON GetAllPassportElements { password = password } =
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
    password <- o A..:? "password"
    return $ GetAllPassportElements { password = password }
 parseJSON _ = mempty
