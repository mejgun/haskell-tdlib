-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportAuthorizationFormAvailableElements where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns already available Telegram Passport elements suitable for completing a Telegram Passport authorization form. Result can be received only once for each authorization form 
-- 
-- __autorization_form_id__ Authorization form identifier
-- 
-- __password__ Password of the current user
data GetPassportAuthorizationFormAvailableElements = 

 GetPassportAuthorizationFormAvailableElements { password :: Maybe String, autorization_form_id :: Maybe Int }  deriving (Eq)

instance Show GetPassportAuthorizationFormAvailableElements where
 show GetPassportAuthorizationFormAvailableElements { password=password, autorization_form_id=autorization_form_id } =
  "GetPassportAuthorizationFormAvailableElements" ++ cc [p "password" password, p "autorization_form_id" autorization_form_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetPassportAuthorizationFormAvailableElements where
 toJSON GetPassportAuthorizationFormAvailableElements { password = password, autorization_form_id = autorization_form_id } =
  A.object [ "@type" A..= T.String "getPassportAuthorizationFormAvailableElements", "password" A..= password, "autorization_form_id" A..= autorization_form_id ]

instance T.FromJSON GetPassportAuthorizationFormAvailableElements where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPassportAuthorizationFormAvailableElements" -> parseGetPassportAuthorizationFormAvailableElements v
   _ -> mempty
  where
   parseGetPassportAuthorizationFormAvailableElements :: A.Value -> T.Parser GetPassportAuthorizationFormAvailableElements
   parseGetPassportAuthorizationFormAvailableElements = A.withObject "GetPassportAuthorizationFormAvailableElements" $ \o -> do
    password <- o A..:? "password"
    autorization_form_id <- mconcat [ o A..:? "autorization_form_id", readMaybe <$> (o A..: "autorization_form_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetPassportAuthorizationFormAvailableElements { password = password, autorization_form_id = autorization_form_id }
 parseJSON _ = mempty
