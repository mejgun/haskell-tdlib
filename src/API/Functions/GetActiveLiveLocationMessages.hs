-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetActiveLiveLocationMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns all active live locations that need to be updated by the application. The list is persistent across application restarts only if the message database is used
data GetActiveLiveLocationMessages = 

 GetActiveLiveLocationMessages deriving (Eq)

instance Show GetActiveLiveLocationMessages where
 show GetActiveLiveLocationMessages {  } =
  "GetActiveLiveLocationMessages" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetActiveLiveLocationMessages where
 toJSON GetActiveLiveLocationMessages {  } =
  A.object [ "@type" A..= T.String "getActiveLiveLocationMessages" ]

instance T.FromJSON GetActiveLiveLocationMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getActiveLiveLocationMessages" -> parseGetActiveLiveLocationMessages v
   _ -> mempty
  where
   parseGetActiveLiveLocationMessages :: A.Value -> T.Parser GetActiveLiveLocationMessages
   parseGetActiveLiveLocationMessages = A.withObject "GetActiveLiveLocationMessages" $ \o -> do
    return $ GetActiveLiveLocationMessages {  }
 parseJSON _ = mempty
