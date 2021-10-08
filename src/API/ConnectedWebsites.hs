-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsites where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ConnectedWebsite as ConnectedWebsite

-- |
-- 
-- Contains a list of websites the current user is logged in with Telegram 
-- 
-- __websites__ List of connected websites
data ConnectedWebsites = 

 ConnectedWebsites { websites :: Maybe [ConnectedWebsite.ConnectedWebsite] }  deriving (Eq)

instance Show ConnectedWebsites where
 show ConnectedWebsites { websites=websites } =
  "ConnectedWebsites" ++ cc [p "websites" websites ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ConnectedWebsites where
 toJSON ConnectedWebsites { websites = websites } =
  A.object [ "@type" A..= T.String "connectedWebsites", "websites" A..= websites ]

instance T.FromJSON ConnectedWebsites where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "connectedWebsites" -> parseConnectedWebsites v
   _ -> mempty
  where
   parseConnectedWebsites :: A.Value -> T.Parser ConnectedWebsites
   parseConnectedWebsites = A.withObject "ConnectedWebsites" $ \o -> do
    websites <- o A..:? "websites"
    return $ ConnectedWebsites { websites = websites }
 parseJSON _ = mempty
