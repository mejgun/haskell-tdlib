-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInactiveSupergroupChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a list of recently inactive supergroups and channels. Can be used when user reaches limit on the number of joined supergroups and channels and receives CHANNELS_TOO_MUCH error
data GetInactiveSupergroupChats = 

 GetInactiveSupergroupChats deriving (Eq)

instance Show GetInactiveSupergroupChats where
 show GetInactiveSupergroupChats {  } =
  "GetInactiveSupergroupChats" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetInactiveSupergroupChats where
 toJSON GetInactiveSupergroupChats {  } =
  A.object [ "@type" A..= T.String "getInactiveSupergroupChats" ]

instance T.FromJSON GetInactiveSupergroupChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInactiveSupergroupChats" -> parseGetInactiveSupergroupChats v
   _ -> mempty
  where
   parseGetInactiveSupergroupChats :: A.Value -> T.Parser GetInactiveSupergroupChats
   parseGetInactiveSupergroupChats = A.withObject "GetInactiveSupergroupChats" $ \o -> do
    return $ GetInactiveSupergroupChats {  }
 parseJSON _ = mempty
