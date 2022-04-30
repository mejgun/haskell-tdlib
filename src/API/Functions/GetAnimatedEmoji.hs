-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAnimatedEmoji where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns an animated emoji corresponding to a given emoji. Returns a 404 error if the emoji has no animated emoji 
-- 
-- __emoji__ The emoji
data GetAnimatedEmoji = 

 GetAnimatedEmoji { emoji :: Maybe String }  deriving (Eq)

instance Show GetAnimatedEmoji where
 show GetAnimatedEmoji { emoji=emoji } =
  "GetAnimatedEmoji" ++ U.cc [U.p "emoji" emoji ]

instance T.ToJSON GetAnimatedEmoji where
 toJSON GetAnimatedEmoji { emoji = emoji } =
  A.object [ "@type" A..= T.String "getAnimatedEmoji", "emoji" A..= emoji ]

instance T.FromJSON GetAnimatedEmoji where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAnimatedEmoji" -> parseGetAnimatedEmoji v
   _ -> mempty
  where
   parseGetAnimatedEmoji :: A.Value -> T.Parser GetAnimatedEmoji
   parseGetAnimatedEmoji = A.withObject "GetAnimatedEmoji" $ \o -> do
    emoji <- o A..:? "emoji"
    return $ GetAnimatedEmoji { emoji = emoji }
 parseJSON _ = mempty
