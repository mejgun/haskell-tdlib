-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAccountTtl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the period of inactivity after which the account of the current user will automatically be deleted
data GetAccountTtl = 

 GetAccountTtl deriving (Eq)

instance Show GetAccountTtl where
 show GetAccountTtl {  } =
  "GetAccountTtl" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetAccountTtl where
 toJSON GetAccountTtl {  } =
  A.object [ "@type" A..= T.String "getAccountTtl" ]

instance T.FromJSON GetAccountTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAccountTtl" -> parseGetAccountTtl v
   _ -> mempty
  where
   parseGetAccountTtl :: A.Value -> T.Parser GetAccountTtl
   parseGetAccountTtl = A.withObject "GetAccountTtl" $ \o -> do
    return $ GetAccountTtl {  }
 parseJSON _ = mempty
