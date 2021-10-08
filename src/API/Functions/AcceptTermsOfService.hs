-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AcceptTermsOfService where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Accepts Telegram terms of services 
-- 
-- __terms_of_service_id__ Terms of service identifier
data AcceptTermsOfService = 

 AcceptTermsOfService { terms_of_service_id :: Maybe String }  deriving (Eq)

instance Show AcceptTermsOfService where
 show AcceptTermsOfService { terms_of_service_id=terms_of_service_id } =
  "AcceptTermsOfService" ++ cc [p "terms_of_service_id" terms_of_service_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AcceptTermsOfService where
 toJSON AcceptTermsOfService { terms_of_service_id = terms_of_service_id } =
  A.object [ "@type" A..= T.String "acceptTermsOfService", "terms_of_service_id" A..= terms_of_service_id ]

instance T.FromJSON AcceptTermsOfService where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "acceptTermsOfService" -> parseAcceptTermsOfService v
   _ -> mempty
  where
   parseAcceptTermsOfService :: A.Value -> T.Parser AcceptTermsOfService
   parseAcceptTermsOfService = A.withObject "AcceptTermsOfService" $ \o -> do
    terms_of_service_id <- o A..:? "terms_of_service_id"
    return $ AcceptTermsOfService { terms_of_service_id = terms_of_service_id }
 parseJSON _ = mempty
