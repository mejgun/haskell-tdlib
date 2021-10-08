-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetConnectedWebsites where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns all website where the current user used Telegram to log in
data GetConnectedWebsites = 

 GetConnectedWebsites deriving (Eq)

instance Show GetConnectedWebsites where
 show GetConnectedWebsites {  } =
  "GetConnectedWebsites" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetConnectedWebsites where
 toJSON GetConnectedWebsites {  } =
  A.object [ "@type" A..= T.String "getConnectedWebsites" ]

instance T.FromJSON GetConnectedWebsites where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getConnectedWebsites" -> parseGetConnectedWebsites v
   _ -> mempty
  where
   parseGetConnectedWebsites :: A.Value -> T.Parser GetConnectedWebsites
   parseGetConnectedWebsites = A.withObject "GetConnectedWebsites" $ \o -> do
    return $ GetConnectedWebsites {  }
 parseJSON _ = mempty
