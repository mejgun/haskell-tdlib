-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupportUser where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a user that can be contacted to get support
data GetSupportUser = 

 GetSupportUser deriving (Eq)

instance Show GetSupportUser where
 show GetSupportUser {  } =
  "GetSupportUser" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetSupportUser where
 toJSON GetSupportUser {  } =
  A.object [ "@type" A..= T.String "getSupportUser" ]

instance T.FromJSON GetSupportUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupportUser" -> parseGetSupportUser v
   _ -> mempty
  where
   parseGetSupportUser :: A.Value -> T.Parser GetSupportUser
   parseGetSupportUser = A.withObject "GetSupportUser" $ \o -> do
    return $ GetSupportUser {  }
 parseJSON _ = mempty
