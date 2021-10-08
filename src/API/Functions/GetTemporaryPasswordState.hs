-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTemporaryPasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns information about the current temporary password
data GetTemporaryPasswordState = 

 GetTemporaryPasswordState deriving (Eq)

instance Show GetTemporaryPasswordState where
 show GetTemporaryPasswordState {  } =
  "GetTemporaryPasswordState" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetTemporaryPasswordState where
 toJSON GetTemporaryPasswordState {  } =
  A.object [ "@type" A..= T.String "getTemporaryPasswordState" ]

instance T.FromJSON GetTemporaryPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTemporaryPasswordState" -> parseGetTemporaryPasswordState v
   _ -> mempty
  where
   parseGetTemporaryPasswordState :: A.Value -> T.Parser GetTemporaryPasswordState
   parseGetTemporaryPasswordState = A.withObject "GetTemporaryPasswordState" $ \o -> do
    return $ GetTemporaryPasswordState {  }
 parseJSON _ = mempty
