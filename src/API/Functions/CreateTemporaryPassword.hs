-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateTemporaryPassword where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Creates a new temporary password for processing payments 
-- 
-- __password__ Persistent user password
-- 
-- __valid_for__ Time during which the temporary password will be valid, in seconds; must be between 60 and 86400
data CreateTemporaryPassword = 

 CreateTemporaryPassword { valid_for :: Maybe Int, password :: Maybe String }  deriving (Eq)

instance Show CreateTemporaryPassword where
 show CreateTemporaryPassword { valid_for=valid_for, password=password } =
  "CreateTemporaryPassword" ++ cc [p "valid_for" valid_for, p "password" password ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateTemporaryPassword where
 toJSON CreateTemporaryPassword { valid_for = valid_for, password = password } =
  A.object [ "@type" A..= T.String "createTemporaryPassword", "valid_for" A..= valid_for, "password" A..= password ]

instance T.FromJSON CreateTemporaryPassword where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createTemporaryPassword" -> parseCreateTemporaryPassword v
   _ -> mempty
  where
   parseCreateTemporaryPassword :: A.Value -> T.Parser CreateTemporaryPassword
   parseCreateTemporaryPassword = A.withObject "CreateTemporaryPassword" $ \o -> do
    valid_for <- mconcat [ o A..:? "valid_for", readMaybe <$> (o A..: "valid_for" :: T.Parser String)] :: T.Parser (Maybe Int)
    password <- o A..:? "password"
    return $ CreateTemporaryPassword { valid_for = valid_for, password = password }
 parseJSON _ = mempty
