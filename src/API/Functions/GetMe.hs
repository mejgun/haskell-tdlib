-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMe where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the current user
data GetMe = 

 GetMe deriving (Eq)

instance Show GetMe where
 show GetMe {  } =
  "GetMe" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMe where
 toJSON GetMe {  } =
  A.object [ "@type" A..= T.String "getMe" ]

instance T.FromJSON GetMe where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMe" -> parseGetMe v
   _ -> mempty
  where
   parseGetMe :: A.Value -> T.Parser GetMe
   parseGetMe = A.withObject "GetMe" $ \o -> do
    return $ GetMe {  }
 parseJSON _ = mempty
