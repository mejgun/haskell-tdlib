-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecoveryEmailAddress where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user 
-- 
-- __password__ The password for the current user
data GetRecoveryEmailAddress = 

 GetRecoveryEmailAddress { password :: Maybe String }  deriving (Eq)

instance Show GetRecoveryEmailAddress where
 show GetRecoveryEmailAddress { password=password } =
  "GetRecoveryEmailAddress" ++ cc [p "password" password ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetRecoveryEmailAddress where
 toJSON GetRecoveryEmailAddress { password = password } =
  A.object [ "@type" A..= T.String "getRecoveryEmailAddress", "password" A..= password ]

instance T.FromJSON GetRecoveryEmailAddress where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecoveryEmailAddress" -> parseGetRecoveryEmailAddress v
   _ -> mempty
  where
   parseGetRecoveryEmailAddress :: A.Value -> T.Parser GetRecoveryEmailAddress
   parseGetRecoveryEmailAddress = A.withObject "GetRecoveryEmailAddress" $ \o -> do
    password <- o A..:? "password"
    return $ GetRecoveryEmailAddress { password = password }
 parseJSON _ = mempty
