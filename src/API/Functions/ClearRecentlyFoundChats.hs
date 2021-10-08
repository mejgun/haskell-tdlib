-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearRecentlyFoundChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Clears the list of recently found chats
data ClearRecentlyFoundChats = 

 ClearRecentlyFoundChats deriving (Eq)

instance Show ClearRecentlyFoundChats where
 show ClearRecentlyFoundChats {  } =
  "ClearRecentlyFoundChats" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ClearRecentlyFoundChats where
 toJSON ClearRecentlyFoundChats {  } =
  A.object [ "@type" A..= T.String "clearRecentlyFoundChats" ]

instance T.FromJSON ClearRecentlyFoundChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearRecentlyFoundChats" -> parseClearRecentlyFoundChats v
   _ -> mempty
  where
   parseClearRecentlyFoundChats :: A.Value -> T.Parser ClearRecentlyFoundChats
   parseClearRecentlyFoundChats = A.withObject "ClearRecentlyFoundChats" $ \o -> do
    return $ ClearRecentlyFoundChats {  }
 parseJSON _ = mempty
