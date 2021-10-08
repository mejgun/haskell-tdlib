-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedCredentials where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes saved credentials for all payment provider bots
data DeleteSavedCredentials = 

 DeleteSavedCredentials deriving (Eq)

instance Show DeleteSavedCredentials where
 show DeleteSavedCredentials {  } =
  "DeleteSavedCredentials" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteSavedCredentials where
 toJSON DeleteSavedCredentials {  } =
  A.object [ "@type" A..= T.String "deleteSavedCredentials" ]

instance T.FromJSON DeleteSavedCredentials where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSavedCredentials" -> parseDeleteSavedCredentials v
   _ -> mempty
  where
   parseDeleteSavedCredentials :: A.Value -> T.Parser DeleteSavedCredentials
   parseDeleteSavedCredentials = A.withObject "DeleteSavedCredentials" $ \o -> do
    return $ DeleteSavedCredentials {  }
 parseJSON _ = mempty
