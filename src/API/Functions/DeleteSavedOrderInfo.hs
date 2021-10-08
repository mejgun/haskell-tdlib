-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedOrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes saved order info
data DeleteSavedOrderInfo = 

 DeleteSavedOrderInfo deriving (Eq)

instance Show DeleteSavedOrderInfo where
 show DeleteSavedOrderInfo {  } =
  "DeleteSavedOrderInfo" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteSavedOrderInfo where
 toJSON DeleteSavedOrderInfo {  } =
  A.object [ "@type" A..= T.String "deleteSavedOrderInfo" ]

instance T.FromJSON DeleteSavedOrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteSavedOrderInfo" -> parseDeleteSavedOrderInfo v
   _ -> mempty
  where
   parseDeleteSavedOrderInfo :: A.Value -> T.Parser DeleteSavedOrderInfo
   parseDeleteSavedOrderInfo = A.withObject "DeleteSavedOrderInfo" $ \o -> do
    return $ DeleteSavedOrderInfo {  }
 parseJSON _ = mempty
