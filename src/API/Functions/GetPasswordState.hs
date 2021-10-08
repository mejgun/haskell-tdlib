-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the current state of 2-step verification
data GetPasswordState = 

 GetPasswordState deriving (Eq)

instance Show GetPasswordState where
 show GetPasswordState {  } =
  "GetPasswordState" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetPasswordState where
 toJSON GetPasswordState {  } =
  A.object [ "@type" A..= T.String "getPasswordState" ]

instance T.FromJSON GetPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPasswordState" -> parseGetPasswordState v
   _ -> mempty
  where
   parseGetPasswordState :: A.Value -> T.Parser GetPasswordState
   parseGetPasswordState = A.withObject "GetPasswordState" $ \o -> do
    return $ GetPasswordState {  }
 parseJSON _ = mempty
